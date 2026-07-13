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
class_name Gs2AdRewardAppLovinMax
extends RefCounted


var allow_ad_unit_id = null
var event_key = null


func with_allow_ad_unit_id(v) -> Gs2AdRewardAppLovinMax:
    allow_ad_unit_id = v
    return self


func with_event_key(v) -> Gs2AdRewardAppLovinMax:
    event_key = v
    return self


static func from_dict(data) -> Gs2AdRewardAppLovinMax:
    if data == null:
        return null
    var ret = Gs2AdRewardAppLovinMax.new()
    ret.allow_ad_unit_id = null if data.get("allowAdUnitId") == null else str(data.get("allowAdUnitId"))
    ret.event_key = null if data.get("eventKey") == null else str(data.get("eventKey"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["allowAdUnitId"] = allow_ad_unit_id
    ret["eventKey"] = event_key
    return ret