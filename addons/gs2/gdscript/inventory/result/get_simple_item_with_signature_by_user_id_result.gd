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
class_name Gs2InventoryGetSimpleItemWithSignatureByUserIdResult
extends RefCounted


var item = null
var simple_item_model = null
var body = null
var signature = null
var metadata = null


func with_item(v) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    item = v
    return self


func with_simple_item_model(v) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    simple_item_model = v
    return self


func with_body(v) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    body = v
    return self


func with_signature(v) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    signature = v
    return self


func with_metadata(v) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2InventoryGetSimpleItemWithSignatureByUserIdResult:
    if data == null:
        return null
    var ret = Gs2InventoryGetSimpleItemWithSignatureByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2InventorySimpleItem.from_dict(data.get("item"))
    ret.simple_item_model = null if data.get("simpleItemModel") == null else Gs2InventorySimpleItemModel.from_dict(data.get("simpleItemModel"))
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["simpleItemModel"] = null if simple_item_model == null else simple_item_model.to_dict()
    ret["body"] = body
    ret["signature"] = signature
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret