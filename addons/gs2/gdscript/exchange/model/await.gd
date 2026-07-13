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
class_name Gs2ExchangeAwait
extends RefCounted


var await_id = null
var user_id = null
var rate_name = null
var name = null
var count = null
var skip_seconds = null
var config = null
var acquirable_at = null
var exchanged_at = null
var created_at = null
var revision = null


func with_await_id(v) -> Gs2ExchangeAwait:
    await_id = v
    return self


func with_user_id(v) -> Gs2ExchangeAwait:
    user_id = v
    return self


func with_rate_name(v) -> Gs2ExchangeAwait:
    rate_name = v
    return self


func with_name(v) -> Gs2ExchangeAwait:
    name = v
    return self


func with_count(v) -> Gs2ExchangeAwait:
    count = v
    return self


func with_skip_seconds(v) -> Gs2ExchangeAwait:
    skip_seconds = v
    return self


func with_config(v) -> Gs2ExchangeAwait:
    config = v
    return self


func with_acquirable_at(v) -> Gs2ExchangeAwait:
    acquirable_at = v
    return self


func with_exchanged_at(v) -> Gs2ExchangeAwait:
    exchanged_at = v
    return self


func with_created_at(v) -> Gs2ExchangeAwait:
    created_at = v
    return self


func with_revision(v) -> Gs2ExchangeAwait:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):user:(?<userId>.+):await:(?<awaitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):user:(?<userId>.+):await:(?<awaitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):user:(?<userId>.+):await:(?<awaitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):user:(?<userId>.+):await:(?<awaitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_await_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):exchange:(?<namespaceName>.+):user:(?<userId>.+):await:(?<awaitName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("awaitName")


static func from_dict(data) -> Gs2ExchangeAwait:
    if data == null:
        return null
    var ret = Gs2ExchangeAwait.new()
    ret.await_id = null if data.get("awaitId") == null else str(data.get("awaitId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.skip_seconds = null if data.get("skipSeconds") == null else int(data.get("skipSeconds"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2ExchangeConfig.from_dict(v))
    ret.acquirable_at = null if data.get("acquirableAt") == null else int(data.get("acquirableAt"))
    ret.exchanged_at = null if data.get("exchangedAt") == null else int(data.get("exchangedAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["awaitId"] = await_id
    ret["userId"] = user_id
    ret["rateName"] = rate_name
    ret["name"] = name
    ret["count"] = count
    ret["skipSeconds"] = skip_seconds
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    ret["acquirableAt"] = acquirable_at
    ret["exchangedAt"] = exchanged_at
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret