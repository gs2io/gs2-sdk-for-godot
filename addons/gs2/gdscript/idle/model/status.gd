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
class_name Gs2IdleStatus
extends RefCounted


var status_id = null
var category_name = null
var user_id = null
var random_seed = null
var idle_minutes = null
var next_rewards_at = null
var maximum_idle_minutes = null
var created_at = null
var updated_at = null
var revision = null


func with_status_id(v) -> Gs2IdleStatus:
    status_id = v
    return self


func with_category_name(v) -> Gs2IdleStatus:
    category_name = v
    return self


func with_user_id(v) -> Gs2IdleStatus:
    user_id = v
    return self


func with_random_seed(v) -> Gs2IdleStatus:
    random_seed = v
    return self


func with_idle_minutes(v) -> Gs2IdleStatus:
    idle_minutes = v
    return self


func with_next_rewards_at(v) -> Gs2IdleStatus:
    next_rewards_at = v
    return self


func with_maximum_idle_minutes(v) -> Gs2IdleStatus:
    maximum_idle_minutes = v
    return self


func with_created_at(v) -> Gs2IdleStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2IdleStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2IdleStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):user:(?<userId>.+):categoryModel:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):user:(?<userId>.+):categoryModel:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):user:(?<userId>.+):categoryModel:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):user:(?<userId>.+):categoryModel:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_category_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):user:(?<userId>.+):categoryModel:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("categoryName")


static func from_dict(data) -> Gs2IdleStatus:
    if data == null:
        return null
    var ret = Gs2IdleStatus.new()
    ret.status_id = null if data.get("statusId") == null else str(data.get("statusId"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.random_seed = null if data.get("randomSeed") == null else int(data.get("randomSeed"))
    ret.idle_minutes = null if data.get("idleMinutes") == null else int(data.get("idleMinutes"))
    ret.next_rewards_at = null if data.get("nextRewardsAt") == null else int(data.get("nextRewardsAt"))
    ret.maximum_idle_minutes = null if data.get("maximumIdleMinutes") == null else int(data.get("maximumIdleMinutes"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["statusId"] = status_id
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["randomSeed"] = random_seed
    ret["idleMinutes"] = idle_minutes
    ret["nextRewardsAt"] = next_rewards_at
    ret["maximumIdleMinutes"] = maximum_idle_minutes
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret