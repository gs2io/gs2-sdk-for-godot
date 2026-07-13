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
class_name Gs2FormationSetFormByStampSheetResult
extends RefCounted


var item = null
var mold = null
var mold_model = null
var form_model = null
var metadata = null


func with_item(v) -> Gs2FormationSetFormByStampSheetResult:
    item = v
    return self


func with_mold(v) -> Gs2FormationSetFormByStampSheetResult:
    mold = v
    return self


func with_mold_model(v) -> Gs2FormationSetFormByStampSheetResult:
    mold_model = v
    return self


func with_form_model(v) -> Gs2FormationSetFormByStampSheetResult:
    form_model = v
    return self


func with_metadata(v) -> Gs2FormationSetFormByStampSheetResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationSetFormByStampSheetResult:
    if data == null:
        return null
    var ret = Gs2FormationSetFormByStampSheetResult.new()
    ret.item = null if data.get("item") == null else Gs2FormationForm.from_dict(data.get("item"))
    ret.mold = null if data.get("mold") == null else Gs2FormationMold.from_dict(data.get("mold"))
    ret.mold_model = null if data.get("moldModel") == null else Gs2FormationMoldModel.from_dict(data.get("moldModel"))
    ret.form_model = null if data.get("formModel") == null else Gs2FormationFormModel.from_dict(data.get("formModel"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["mold"] = null if mold == null else mold.to_dict()
    ret["moldModel"] = null if mold_model == null else mold_model.to_dict()
    ret["formModel"] = null if form_model == null else form_model.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret