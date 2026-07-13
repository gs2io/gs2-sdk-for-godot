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
class_name Gs2FormationGetPropertyFormByUserIdResult
extends RefCounted


var item = null
var property_form_model = null
var metadata = null


func with_item(v) -> Gs2FormationGetPropertyFormByUserIdResult:
    item = v
    return self


func with_property_form_model(v) -> Gs2FormationGetPropertyFormByUserIdResult:
    property_form_model = v
    return self


func with_metadata(v) -> Gs2FormationGetPropertyFormByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationGetPropertyFormByUserIdResult:
    if data == null:
        return null
    var ret = Gs2FormationGetPropertyFormByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2FormationPropertyForm.from_dict(data.get("item"))
    ret.property_form_model = null if data.get("propertyFormModel") == null else Gs2FormationPropertyFormModel.from_dict(data.get("propertyFormModel"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["propertyFormModel"] = null if property_form_model == null else property_form_model.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret