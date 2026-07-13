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
class_name Gs2FormationGetPropertyFormWithSignatureResult
extends RefCounted


var item = null
var body = null
var signature = null
var property_form_model = null
var metadata = null


func with_item(v) -> Gs2FormationGetPropertyFormWithSignatureResult:
    item = v
    return self


func with_body(v) -> Gs2FormationGetPropertyFormWithSignatureResult:
    body = v
    return self


func with_signature(v) -> Gs2FormationGetPropertyFormWithSignatureResult:
    signature = v
    return self


func with_property_form_model(v) -> Gs2FormationGetPropertyFormWithSignatureResult:
    property_form_model = v
    return self


func with_metadata(v) -> Gs2FormationGetPropertyFormWithSignatureResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationGetPropertyFormWithSignatureResult:
    if data == null:
        return null
    var ret = Gs2FormationGetPropertyFormWithSignatureResult.new()
    ret.item = null if data.get("item") == null else Gs2FormationPropertyForm.from_dict(data.get("item"))
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.property_form_model = null if data.get("propertyFormModel") == null else Gs2FormationPropertyFormModel.from_dict(data.get("propertyFormModel"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["body"] = body
    ret["signature"] = signature
    ret["propertyFormModel"] = null if property_form_model == null else property_form_model.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret