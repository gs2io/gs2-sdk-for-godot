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
class_name Gs2ProjectProject
extends RefCounted


var project_id = null
var account_name = null
var name = null
var description = null
var plan = null
var regions = null
var billing_method_name = null
var enable_event_bridge = null
var currency = null
var event_bridge_aws_account_id = null
var event_bridge_aws_region = null
var data_store_key_scheme = null
var created_at = null
var updated_at = null


func with_project_id(v) -> Gs2ProjectProject:
    project_id = v
    return self


func with_account_name(v) -> Gs2ProjectProject:
    account_name = v
    return self


func with_name(v) -> Gs2ProjectProject:
    name = v
    return self


func with_description(v) -> Gs2ProjectProject:
    description = v
    return self


func with_plan(v) -> Gs2ProjectProject:
    plan = v
    return self


func with_regions(v) -> Gs2ProjectProject:
    regions = v
    return self


func with_billing_method_name(v) -> Gs2ProjectProject:
    billing_method_name = v
    return self


func with_enable_event_bridge(v) -> Gs2ProjectProject:
    enable_event_bridge = v
    return self


func with_currency(v) -> Gs2ProjectProject:
    currency = v
    return self


func with_event_bridge_aws_account_id(v) -> Gs2ProjectProject:
    event_bridge_aws_account_id = v
    return self


func with_event_bridge_aws_region(v) -> Gs2ProjectProject:
    event_bridge_aws_region = v
    return self


func with_data_store_key_scheme(v) -> Gs2ProjectProject:
    data_store_key_scheme = v
    return self


func with_created_at(v) -> Gs2ProjectProject:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ProjectProject:
    updated_at = v
    return self


static func get_account_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("accountName")


static func get_project_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:::gs2:account:(?<accountName>.+):project:(?<projectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("projectName")


static func from_dict(data) -> Gs2ProjectProject:
    if data == null:
        return null
    var ret = Gs2ProjectProject.new()
    ret.project_id = null if data.get("projectId") == null else str(data.get("projectId"))
    ret.account_name = null if data.get("accountName") == null else str(data.get("accountName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.plan = null if data.get("plan") == null else str(data.get("plan"))
    ret.regions = null if data.get("regions") == null else data.get("regions").map(func(v): return Gs2ProjectGs2Region.from_dict(v))
    ret.billing_method_name = null if data.get("billingMethodName") == null else str(data.get("billingMethodName"))
    ret.enable_event_bridge = null if data.get("enableEventBridge") == null else str(data.get("enableEventBridge"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.event_bridge_aws_account_id = null if data.get("eventBridgeAwsAccountId") == null else str(data.get("eventBridgeAwsAccountId"))
    ret.event_bridge_aws_region = null if data.get("eventBridgeAwsRegion") == null else str(data.get("eventBridgeAwsRegion"))
    ret.data_store_key_scheme = null if data.get("dataStoreKeyScheme") == null else str(data.get("dataStoreKeyScheme"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["projectId"] = project_id
    ret["accountName"] = account_name
    ret["name"] = name
    ret["description"] = description
    ret["plan"] = plan
    ret["regions"] = null if regions == null else regions.map(func(v): return null if v == null else v.to_dict())
    ret["billingMethodName"] = billing_method_name
    ret["enableEventBridge"] = enable_event_bridge
    ret["currency"] = currency
    ret["eventBridgeAwsAccountId"] = event_bridge_aws_account_id
    ret["eventBridgeAwsRegion"] = event_bridge_aws_region
    ret["dataStoreKeyScheme"] = data_store_key_scheme
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret