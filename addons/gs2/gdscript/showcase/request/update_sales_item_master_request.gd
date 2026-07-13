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
class_name Gs2ShowcaseUpdateSalesItemMasterRequest
extends Gs2Request


var namespace_name = null
var sales_item_name = null
var description = null
var metadata = null
var verify_actions = null
var consume_actions = null
var acquire_actions = null


func with_namespace_name(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    namespace_name = v
    return self


func with_sales_item_name(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    sales_item_name = v
    return self


func with_description(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    acquire_actions = v
    return self


static func from_dict(data) -> Gs2ShowcaseUpdateSalesItemMasterRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseUpdateSalesItemMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.sales_item_name = null if data.get("salesItemName") == null else str(data.get("salesItemName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["salesItemName"] = sales_item_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    return ret