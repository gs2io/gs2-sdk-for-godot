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
class_name Gs2FormationSlotWithSignature
extends RefCounted


var name = null
var property_type = null
var body = null
var signature = null
var metadata = null


func with_name(v) -> Gs2FormationSlotWithSignature:
    name = v
    return self


func with_property_type(v) -> Gs2FormationSlotWithSignature:
    property_type = v
    return self


func with_body(v) -> Gs2FormationSlotWithSignature:
    body = v
    return self


func with_signature(v) -> Gs2FormationSlotWithSignature:
    signature = v
    return self


func with_metadata(v) -> Gs2FormationSlotWithSignature:
    metadata = v
    return self


static func from_dict(data) -> Gs2FormationSlotWithSignature:
    if data == null:
        return null
    var ret = Gs2FormationSlotWithSignature.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.property_type = null if data.get("propertyType") == null else str(data.get("propertyType"))
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["propertyType"] = property_type
    ret["body"] = body
    ret["signature"] = signature
    ret["metadata"] = metadata
    return ret