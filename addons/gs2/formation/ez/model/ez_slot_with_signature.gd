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
class_name Gs2FormationEzSlotWithSignature
extends RefCounted


var name = null
var property_type = null
var body = null
var signature = null
var metadata = null


func with_name(v) -> Gs2FormationEzSlotWithSignature:
    name = v
    return self


func with_property_type(v) -> Gs2FormationEzSlotWithSignature:
    property_type = v
    return self


func with_body(v) -> Gs2FormationEzSlotWithSignature:
    body = v
    return self


func with_signature(v) -> Gs2FormationEzSlotWithSignature:
    signature = v
    return self


func with_metadata(v) -> Gs2FormationEzSlotWithSignature:
    metadata = v
    return self


func to_model() -> Gs2FormationSlotWithSignature:
    var ret = Gs2FormationSlotWithSignature.new()
    ret.name = name
    ret.property_type = property_type
    ret.body = body
    ret.signature = signature
    ret.metadata = metadata
    return ret


static func from_model(model) -> Gs2FormationEzSlotWithSignature:
    var ret = Gs2FormationEzSlotWithSignature.new()
    ret.name = model.name
    ret.property_type = model.property_type
    ret.body = model.body
    ret.signature = model.signature
    ret.metadata = model.metadata
    return ret