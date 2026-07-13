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
class_name Gs2Ranking2CreateSubscribeRankingModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var minimum_value = null
var maximum_value = null
var sum = null
var order_direction = null
var entry_period_event_id = null
var access_period_event_id = null


func with_namespace_name(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    metadata = v
    return self


func with_minimum_value(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    minimum_value = v
    return self


func with_maximum_value(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    maximum_value = v
    return self


func with_sum(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    sum = v
    return self


func with_order_direction(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    order_direction = v
    return self


func with_entry_period_event_id(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    entry_period_event_id = v
    return self


func with_access_period_event_id(v) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    access_period_event_id = v
    return self


static func from_dict(data) -> Gs2Ranking2CreateSubscribeRankingModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2Ranking2CreateSubscribeRankingModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.minimum_value = null if data.get("minimumValue") == null else int(data.get("minimumValue"))
    ret.maximum_value = null if data.get("maximumValue") == null else int(data.get("maximumValue"))
    ret.sum = null if data.get("sum") == null else bool(data.get("sum"))
    ret.order_direction = null if data.get("orderDirection") == null else str(data.get("orderDirection"))
    ret.entry_period_event_id = null if data.get("entryPeriodEventId") == null else str(data.get("entryPeriodEventId"))
    ret.access_period_event_id = null if data.get("accessPeriodEventId") == null else str(data.get("accessPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["minimumValue"] = minimum_value
    ret["maximumValue"] = maximum_value
    ret["sum"] = sum
    ret["orderDirection"] = order_direction
    ret["entryPeriodEventId"] = entry_period_event_id
    ret["accessPeriodEventId"] = access_period_event_id
    return ret