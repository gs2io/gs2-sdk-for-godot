# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#
# Steady（専用フリート）の基点。
#
# フリートは 1 つの名前（steady_endpoint、例 https://bs-dev.ap-northeast-1.dev.gen2.gs2io.com）で受け、
# REST は <steady>/<service>/...、WebSocket は wss://<host>/ を使う。名前はフリートのノードへ直接
# 解決される（間に ALB は無い）ので、フリートが手放した公開 IP に当たると SYN が落ちる。
# そのため Steady のときだけ接続段階に上限（CONNECT_TIMEOUT_MS）を置き、接続段階の失敗
# （1 バイトも送っていない）だけは同じ要求をもう 1 回だけ送る。送信後の失敗は届いたかもしれない
# ので再送しない（非冪等要求の二重実行を作らない）。
class_name Gs2Steady
extends RefCounted


## Steady の基点への接続（DNS / TCP / TLS handshake）の上限 (msec)。
## フリートが手放した公開 IP は SYN を落とすので、OS 既定（数十秒〜数分）に任せない。
## 共有クラウド（steady_endpoint が空）には適用しない
const CONNECT_TIMEOUT_MS: int = 5 * 1000


## 末尾の / と空白を落とす
static func normalize_steady_endpoint(value) -> String:
    if value == null:
        return ""
    return str(value).strip_edges().rstrip("/")


## steady_endpoint から REST の template（{service} 付き）を作る。空なら ""
static func steady_rest_template(steady) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    return base + "/{service}"


## steady_endpoint から WebSocket の接続先を作る。空・壊れた基点なら ""。
## http:// の基点（ローカルの試験・開発）は ws:// に、https:// は wss:// に
static func steady_web_socket_url(steady) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    var scheme_end = base.find("://")
    if scheme_end == -1:
        return ""
    var scheme = base.substr(0, scheme_end)
    var remainder = base.substr(scheme_end + 3)
    var slash_pos = remainder.find("/")
    var host = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
    if host == "":
        return ""
    return ("ws" if scheme == "http" else "wss") + "://" + host + "/"


## 要求 URL が Steady の基点宛か
static func is_steady_url(steady, request_url: String) -> bool:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return false
    return request_url == base or request_url.begins_with(base + "/")


## template（共有クラウドの Gs2Constant.ENDPOINT_HOST）から組まれた URL を
## Steady の基点配下 <steady>/<service>/... へ書き換える。書き換えられないなら ""。
##
## ★GDScript の生成されたクライアントは Gs2Constant.ENDPOINT_HOST から URL を直接組み、
## サービスごとの override を持たない（Go の EndpointHost(service, endpointHost) 相当が無い）。
## そのため「どのサービス宛か」は組まれた URL から template の形で読み戻す。
## template に当てはまらない URL（署名付き URL 等）は "" を返して呼び出し元がそのまま使う。
static func steady_rest_url(steady, template: String, region: String, request_url: String) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    var resolved = template.replace("{region}", region)
    var service_pos = resolved.find("{service}")
    if service_pos == -1:
        return ""
    var prefix = resolved.substr(0, service_pos)
    var suffix = resolved.substr(service_pos + "{service}".length())
    if not request_url.begins_with(prefix):
        return ""
    var remainder = request_url.substr(prefix.length())
    var service = ""
    var path = ""
    if suffix == "":
        # template が {service} で終わる形（例 https://custom.example.test/{service}）
        var slash_pos = remainder.find("/")
        service = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
        path = "" if slash_pos == -1 else remainder.substr(slash_pos)
    else:
        var suffix_pos = remainder.find(suffix)
        if suffix_pos <= 0:
            return ""
        service = remainder.substr(0, suffix_pos)
        path = remainder.substr(suffix_pos + suffix.length())
    if service == "" or service.contains("/"):
        return ""
    return base + "/" + service + path


## HTTPClient の状態が「1 バイトも送っていない」失敗か（DNS / TCP の接続 / TLS handshake）。
## これだけが再送の対象。
##
## ★STATUS_CONNECTION_ERROR は接続段階でも送信後でも立つので、接続段階（request() を呼ぶ前）に
## 限って呼ぶこと。送信後の失敗（STATUS_REQUESTING のまま打ち切り・本文の途中切断・5xx）は
## 届いたかもしれないので再送してはいけない。
## ★HTTPRequest（RESULT_CANT_CONNECT / RESULT_CANT_RESOLVE / RESULT_TLS_HANDSHAKE_ERROR /
## RESULT_CONNECTION_ERROR）は GDScript の SDK では使っていない（Gs2RestSession は HTTPClient を
## 直接回す）ので、対応する判定は置かない。
static func is_connect_failure_status(status: int) -> bool:
    return status == HTTPClient.STATUS_CANT_RESOLVE \
        or status == HTTPClient.STATUS_CANT_CONNECT \
        or status == HTTPClient.STATUS_TLS_HANDSHAKE_ERROR \
        or status == HTTPClient.STATUS_CONNECTION_ERROR
