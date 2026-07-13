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
class_name Gs2LimitCounter
extends RefCounted


var counter_id = null
var limit_name = null
var name = null
var user_id = null
var count = null
var next_reset_at = null
var created_at = null
var updated_at = null
var revision = null


func with_counter_id(v) -> Gs2LimitCounter:
    counter_id = v
    return self


func with_limit_name(v) -> Gs2LimitCounter:
    limit_name = v
    return self


func with_name(v) -> Gs2LimitCounter:
    name = v
    return self


func with_user_id(v) -> Gs2LimitCounter:
    user_id = v
    return self


func with_count(v) -> Gs2LimitCounter:
    count = v
    return self


func with_next_reset_at(v) -> Gs2LimitCounter:
    next_reset_at = v
    return self


func with_created_at(v) -> Gs2LimitCounter:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LimitCounter:
    updated_at = v
    return self


func with_revision(v) -> Gs2LimitCounter:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_limit_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("limitName")


static func get_counter_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):limit:(?<namespaceName>.+):user:(?<userId>.+):limit:(?<limitName>.+):counter:(?<counterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("counterName")


static func from_dict(data) -> Gs2LimitCounter:
    if data == null:
        return null
    var ret = Gs2LimitCounter.new()
    ret.counter_id = null if data.get("counterId") == null else str(data.get("counterId"))
    ret.limit_name = null if data.get("limitName") == null else str(data.get("limitName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.next_reset_at = null if data.get("nextResetAt") == null else int(data.get("nextResetAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["counterId"] = counter_id
    ret["limitName"] = limit_name
    ret["name"] = name
    ret["userId"] = user_id
    ret["count"] = count
    ret["nextResetAt"] = next_reset_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret