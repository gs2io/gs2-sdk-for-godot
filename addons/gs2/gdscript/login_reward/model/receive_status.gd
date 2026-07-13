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
class_name Gs2LoginRewardReceiveStatus
extends RefCounted


var receive_status_id = null
var bonus_model_name = null
var user_id = null
var received_steps = null
var last_received_at = null
var created_at = null
var updated_at = null
var revision = null


func with_receive_status_id(v) -> Gs2LoginRewardReceiveStatus:
    receive_status_id = v
    return self


func with_bonus_model_name(v) -> Gs2LoginRewardReceiveStatus:
    bonus_model_name = v
    return self


func with_user_id(v) -> Gs2LoginRewardReceiveStatus:
    user_id = v
    return self


func with_received_steps(v) -> Gs2LoginRewardReceiveStatus:
    received_steps = v
    return self


func with_last_received_at(v) -> Gs2LoginRewardReceiveStatus:
    last_received_at = v
    return self


func with_created_at(v) -> Gs2LoginRewardReceiveStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LoginRewardReceiveStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2LoginRewardReceiveStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):loginReward:(?<namespaceName>.+):user:(?<userId>.+):status:(?<bonusModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):loginReward:(?<namespaceName>.+):user:(?<userId>.+):status:(?<bonusModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):loginReward:(?<namespaceName>.+):user:(?<userId>.+):status:(?<bonusModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):loginReward:(?<namespaceName>.+):user:(?<userId>.+):status:(?<bonusModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_bonus_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):loginReward:(?<namespaceName>.+):user:(?<userId>.+):status:(?<bonusModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("bonusModelName")


static func from_dict(data) -> Gs2LoginRewardReceiveStatus:
    if data == null:
        return null
    var ret = Gs2LoginRewardReceiveStatus.new()
    ret.receive_status_id = null if data.get("receiveStatusId") == null else str(data.get("receiveStatusId"))
    ret.bonus_model_name = null if data.get("bonusModelName") == null else str(data.get("bonusModelName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.received_steps = null if data.get("receivedSteps") == null else data.get("receivedSteps").map(func(v): return bool(v))
    ret.last_received_at = null if data.get("lastReceivedAt") == null else int(data.get("lastReceivedAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["receiveStatusId"] = receive_status_id
    ret["bonusModelName"] = bonus_model_name
    ret["userId"] = user_id
    ret["receivedSteps"] = received_steps
    ret["lastReceivedAt"] = last_received_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret