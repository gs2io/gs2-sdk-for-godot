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
class_name Gs2ShowcaseIncrementPurchaseCountRequest
extends Gs2Request


var namespace_name = null
var showcase_name = null
var display_item_name = null
var access_token = null
var count = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    namespace_name = v
    return self


func with_showcase_name(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    showcase_name = v
    return self


func with_display_item_name(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    display_item_name = v
    return self


func with_access_token(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    access_token = v
    return self


func with_count(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    count = v
    return self


func with_duplication_avoider(v) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ShowcaseIncrementPurchaseCountRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseIncrementPurchaseCountRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.showcase_name = null if data.get("showcaseName") == null else str(data.get("showcaseName"))
    ret.display_item_name = null if data.get("displayItemName") == null else str(data.get("displayItemName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["showcaseName"] = showcase_name
    ret["displayItemName"] = display_item_name
    ret["accessToken"] = access_token
    ret["count"] = count
    return ret