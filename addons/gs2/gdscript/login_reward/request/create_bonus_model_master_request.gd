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
class_name Gs2LoginRewardCreateBonusModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var mode = null
var period_event_id = null
var reset_hour = null
var repeat = null
var rewards = null
var missed_receive_relief = null
var missed_receive_relief_verify_actions = null
var missed_receive_relief_consume_actions = null


func with_namespace_name(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    metadata = v
    return self


func with_mode(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    mode = v
    return self


func with_period_event_id(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    period_event_id = v
    return self


func with_reset_hour(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    reset_hour = v
    return self


func with_repeat(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    repeat = v
    return self


func with_rewards(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    rewards = v
    return self


func with_missed_receive_relief(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    missed_receive_relief = v
    return self


func with_missed_receive_relief_verify_actions(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    missed_receive_relief_verify_actions = v
    return self


func with_missed_receive_relief_consume_actions(v) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    missed_receive_relief_consume_actions = v
    return self


static func from_dict(data) -> Gs2LoginRewardCreateBonusModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2LoginRewardCreateBonusModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.period_event_id = null if data.get("periodEventId") == null else str(data.get("periodEventId"))
    ret.reset_hour = null if data.get("resetHour") == null else int(data.get("resetHour"))
    ret.repeat = null if data.get("repeat") == null else str(data.get("repeat"))
    ret.rewards = null if data.get("rewards") == null else data.get("rewards").map(func(v): return Gs2LoginRewardReward.from_dict(v))
    ret.missed_receive_relief = null if data.get("missedReceiveRelief") == null else str(data.get("missedReceiveRelief"))
    ret.missed_receive_relief_verify_actions = null if data.get("missedReceiveReliefVerifyActions") == null else data.get("missedReceiveReliefVerifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.missed_receive_relief_consume_actions = null if data.get("missedReceiveReliefConsumeActions") == null else data.get("missedReceiveReliefConsumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["mode"] = mode
    ret["periodEventId"] = period_event_id
    ret["resetHour"] = reset_hour
    ret["repeat"] = repeat
    ret["rewards"] = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_dict())
    ret["missedReceiveRelief"] = missed_receive_relief
    ret["missedReceiveReliefVerifyActions"] = null if missed_receive_relief_verify_actions == null else missed_receive_relief_verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["missedReceiveReliefConsumeActions"] = null if missed_receive_relief_consume_actions == null else missed_receive_relief_consume_actions.map(func(v): return null if v == null else v.to_dict())
    return ret