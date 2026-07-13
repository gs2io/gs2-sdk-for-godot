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
class_name Gs2MissionCreateCounterModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var metadata = null
var description = null
var scopes = null
var challenge_period_event_id = null


func with_namespace_name(v) -> Gs2MissionCreateCounterModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2MissionCreateCounterModelMasterRequest:
    name = v
    return self


func with_metadata(v) -> Gs2MissionCreateCounterModelMasterRequest:
    metadata = v
    return self


func with_description(v) -> Gs2MissionCreateCounterModelMasterRequest:
    description = v
    return self


func with_scopes(v) -> Gs2MissionCreateCounterModelMasterRequest:
    scopes = v
    return self


func with_challenge_period_event_id(v) -> Gs2MissionCreateCounterModelMasterRequest:
    challenge_period_event_id = v
    return self


static func from_dict(data) -> Gs2MissionCreateCounterModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2MissionCreateCounterModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.scopes = null if data.get("scopes") == null else data.get("scopes").map(func(v): return Gs2MissionCounterScopeModel.from_dict(v))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["scopes"] = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_dict())
    ret["challengePeriodEventId"] = challenge_period_event_id
    return ret