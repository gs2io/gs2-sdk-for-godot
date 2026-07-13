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
class_name Gs2ProjectCreateProjectRequest
extends Gs2Request


var account_token = null
var name = null
var description = null
var plan = null
var currency = null
var activate_region_name = null
var billing_method_name = null
var enable_event_bridge = null
var event_bridge_aws_account_id = null
var event_bridge_aws_region = null


func with_account_token(v) -> Gs2ProjectCreateProjectRequest:
    account_token = v
    return self


func with_name(v) -> Gs2ProjectCreateProjectRequest:
    name = v
    return self


func with_description(v) -> Gs2ProjectCreateProjectRequest:
    description = v
    return self


func with_plan(v) -> Gs2ProjectCreateProjectRequest:
    plan = v
    return self


func with_currency(v) -> Gs2ProjectCreateProjectRequest:
    currency = v
    return self


func with_activate_region_name(v) -> Gs2ProjectCreateProjectRequest:
    activate_region_name = v
    return self


func with_billing_method_name(v) -> Gs2ProjectCreateProjectRequest:
    billing_method_name = v
    return self


func with_enable_event_bridge(v) -> Gs2ProjectCreateProjectRequest:
    enable_event_bridge = v
    return self


func with_event_bridge_aws_account_id(v) -> Gs2ProjectCreateProjectRequest:
    event_bridge_aws_account_id = v
    return self


func with_event_bridge_aws_region(v) -> Gs2ProjectCreateProjectRequest:
    event_bridge_aws_region = v
    return self


static func from_dict(data) -> Gs2ProjectCreateProjectRequest:
    if data == null:
        return null
    var ret = Gs2ProjectCreateProjectRequest.new()
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.plan = null if data.get("plan") == null else str(data.get("plan"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.activate_region_name = null if data.get("activateRegionName") == null else str(data.get("activateRegionName"))
    ret.billing_method_name = null if data.get("billingMethodName") == null else str(data.get("billingMethodName"))
    ret.enable_event_bridge = null if data.get("enableEventBridge") == null else str(data.get("enableEventBridge"))
    ret.event_bridge_aws_account_id = null if data.get("eventBridgeAwsAccountId") == null else str(data.get("eventBridgeAwsAccountId"))
    ret.event_bridge_aws_region = null if data.get("eventBridgeAwsRegion") == null else str(data.get("eventBridgeAwsRegion"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountToken"] = account_token
    ret["name"] = name
    ret["description"] = description
    ret["plan"] = plan
    ret["currency"] = currency
    ret["activateRegionName"] = activate_region_name
    ret["billingMethodName"] = billing_method_name
    ret["enableEventBridge"] = enable_event_bridge
    ret["eventBridgeAwsAccountId"] = event_bridge_aws_account_id
    ret["eventBridgeAwsRegion"] = event_bridge_aws_region
    return ret