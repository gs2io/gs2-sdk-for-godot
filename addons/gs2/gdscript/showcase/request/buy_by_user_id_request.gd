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
class_name Gs2ShowcaseBuyByUserIdRequest
extends Gs2Request


var namespace_name = null
var showcase_name = null
var display_item_id = null
var user_id = null
var quantity = null
var config = null
var route_key = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ShowcaseBuyByUserIdRequest:
    namespace_name = v
    return self


func with_showcase_name(v) -> Gs2ShowcaseBuyByUserIdRequest:
    showcase_name = v
    return self


func with_display_item_id(v) -> Gs2ShowcaseBuyByUserIdRequest:
    display_item_id = v
    return self


func with_user_id(v) -> Gs2ShowcaseBuyByUserIdRequest:
    user_id = v
    return self


func with_quantity(v) -> Gs2ShowcaseBuyByUserIdRequest:
    quantity = v
    return self


func with_config(v) -> Gs2ShowcaseBuyByUserIdRequest:
    config = v
    return self


func with_route_key(v) -> Gs2ShowcaseBuyByUserIdRequest:
    route_key = v
    return self


func with_time_offset_token(v) -> Gs2ShowcaseBuyByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ShowcaseBuyByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ShowcaseBuyByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseBuyByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.showcase_name = null if data.get("showcaseName") == null else str(data.get("showcaseName"))
    ret.display_item_id = null if data.get("displayItemId") == null else str(data.get("displayItemId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.quantity = null if data.get("quantity") == null else int(data.get("quantity"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2ShowcaseConfig.from_dict(v))
    ret.route_key = null if data.get("routeKey") == null else str(data.get("routeKey"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["showcaseName"] = showcase_name
    ret["displayItemId"] = display_item_id
    ret["userId"] = user_id
    ret["quantity"] = quantity
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    ret["routeKey"] = route_key
    ret["timeOffsetToken"] = time_offset_token
    return ret