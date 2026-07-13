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
class_name Gs2LogUpdateDashboardRequest
extends Gs2Request


var namespace_name = null
var dashboard_name = null
var display_name = null
var description = null
var payload = null


func with_namespace_name(v) -> Gs2LogUpdateDashboardRequest:
    namespace_name = v
    return self


func with_dashboard_name(v) -> Gs2LogUpdateDashboardRequest:
    dashboard_name = v
    return self


func with_display_name(v) -> Gs2LogUpdateDashboardRequest:
    display_name = v
    return self


func with_description(v) -> Gs2LogUpdateDashboardRequest:
    description = v
    return self


func with_payload(v) -> Gs2LogUpdateDashboardRequest:
    payload = v
    return self


static func from_dict(data) -> Gs2LogUpdateDashboardRequest:
    if data == null:
        return null
    var ret = Gs2LogUpdateDashboardRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.dashboard_name = null if data.get("dashboardName") == null else str(data.get("dashboardName"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["dashboardName"] = dashboard_name
    ret["displayName"] = display_name
    ret["description"] = description
    ret["payload"] = payload
    return ret