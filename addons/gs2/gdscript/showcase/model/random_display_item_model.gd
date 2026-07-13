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
class_name Gs2ShowcaseRandomDisplayItemModel
extends RefCounted


var name = null
var metadata = null
var verify_actions = null
var consume_actions = null
var acquire_actions = null
var stock = null
var weight = null


func with_name(v) -> Gs2ShowcaseRandomDisplayItemModel:
    name = v
    return self


func with_metadata(v) -> Gs2ShowcaseRandomDisplayItemModel:
    metadata = v
    return self


func with_verify_actions(v) -> Gs2ShowcaseRandomDisplayItemModel:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2ShowcaseRandomDisplayItemModel:
    consume_actions = v
    return self


func with_acquire_actions(v) -> Gs2ShowcaseRandomDisplayItemModel:
    acquire_actions = v
    return self


func with_stock(v) -> Gs2ShowcaseRandomDisplayItemModel:
    stock = v
    return self


func with_weight(v) -> Gs2ShowcaseRandomDisplayItemModel:
    weight = v
    return self


static func from_dict(data) -> Gs2ShowcaseRandomDisplayItemModel:
    if data == null:
        return null
    var ret = Gs2ShowcaseRandomDisplayItemModel.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.stock = null if data.get("stock") == null else int(data.get("stock"))
    ret.weight = null if data.get("weight") == null else int(data.get("weight"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["metadata"] = metadata
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["stock"] = stock
    ret["weight"] = weight
    return ret