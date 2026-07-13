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
class_name Gs2QuestProgress
extends RefCounted


var progress_id = null
var user_id = null
var transaction_id = null
var quest_model_id = null
var random_seed = null
var rewards = null
var failed_rewards = null
var metadata = null
var created_at = null
var updated_at = null
var revision = null


func with_progress_id(v) -> Gs2QuestProgress:
    progress_id = v
    return self


func with_user_id(v) -> Gs2QuestProgress:
    user_id = v
    return self


func with_transaction_id(v) -> Gs2QuestProgress:
    transaction_id = v
    return self


func with_quest_model_id(v) -> Gs2QuestProgress:
    quest_model_id = v
    return self


func with_random_seed(v) -> Gs2QuestProgress:
    random_seed = v
    return self


func with_rewards(v) -> Gs2QuestProgress:
    rewards = v
    return self


func with_failed_rewards(v) -> Gs2QuestProgress:
    failed_rewards = v
    return self


func with_metadata(v) -> Gs2QuestProgress:
    metadata = v
    return self


func with_created_at(v) -> Gs2QuestProgress:
    created_at = v
    return self


func with_updated_at(v) -> Gs2QuestProgress:
    updated_at = v
    return self


func with_revision(v) -> Gs2QuestProgress:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2QuestProgress:
    if data == null:
        return null
    var ret = Gs2QuestProgress.new()
    ret.progress_id = null if data.get("progressId") == null else str(data.get("progressId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.quest_model_id = null if data.get("questModelId") == null else str(data.get("questModelId"))
    ret.random_seed = null if data.get("randomSeed") == null else int(data.get("randomSeed"))
    ret.rewards = null if data.get("rewards") == null else data.get("rewards").map(func(v): return Gs2QuestReward.from_dict(v))
    ret.failed_rewards = null if data.get("failedRewards") == null else data.get("failedRewards").map(func(v): return Gs2QuestReward.from_dict(v))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["progressId"] = progress_id
    ret["userId"] = user_id
    ret["transactionId"] = transaction_id
    ret["questModelId"] = quest_model_id
    ret["randomSeed"] = random_seed
    ret["rewards"] = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_dict())
    ret["failedRewards"] = null if failed_rewards == null else failed_rewards.map(func(v): return null if v == null else v.to_dict())
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret