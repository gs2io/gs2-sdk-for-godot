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
class_name Gs2InventoryEzSimpleInventoryModel
extends RefCounted


var name = null
var metadata = null


func with_name(v) -> Gs2InventoryEzSimpleInventoryModel:
    name = v
    return self


func with_metadata(v) -> Gs2InventoryEzSimpleInventoryModel:
    metadata = v
    return self


func to_model() -> Gs2InventorySimpleInventoryModel:
    var ret = Gs2InventorySimpleInventoryModel.new()
    ret.name = name
    ret.metadata = metadata
    return ret


static func from_model(model) -> Gs2InventoryEzSimpleInventoryModel:
    var ret = Gs2InventoryEzSimpleInventoryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    return ret