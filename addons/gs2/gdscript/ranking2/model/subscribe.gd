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
class_name Gs2Ranking2Subscribe
extends RefCounted


var subscribe_id = null
var ranking_name = null
var user_id = null
var target_user_ids = null
var from_user_ids = null
var created_at = null
var updated_at = null
var revision = null


func with_subscribe_id(v) -> Gs2Ranking2Subscribe:
    subscribe_id = v
    return self


func with_ranking_name(v) -> Gs2Ranking2Subscribe:
    ranking_name = v
    return self


func with_user_id(v) -> Gs2Ranking2Subscribe:
    user_id = v
    return self


func with_target_user_ids(v) -> Gs2Ranking2Subscribe:
    target_user_ids = v
    return self


func with_from_user_ids(v) -> Gs2Ranking2Subscribe:
    from_user_ids = v
    return self


func with_created_at(v) -> Gs2Ranking2Subscribe:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Ranking2Subscribe:
    updated_at = v
    return self


func with_revision(v) -> Gs2Ranking2Subscribe:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_ranking_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<rankingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rankingName")


static func from_dict(data) -> Gs2Ranking2Subscribe:
    if data == null:
        return null
    var ret = Gs2Ranking2Subscribe.new()
    ret.subscribe_id = null if data.get("subscribeId") == null else str(data.get("subscribeId"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_user_ids = null if data.get("targetUserIds") == null else data.get("targetUserIds").map(func(v): return str(v))
    ret.from_user_ids = null if data.get("fromUserIds") == null else data.get("fromUserIds").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscribeId"] = subscribe_id
    ret["rankingName"] = ranking_name
    ret["userId"] = user_id
    ret["targetUserIds"] = target_user_ids
    ret["fromUserIds"] = from_user_ids
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret