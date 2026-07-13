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
class_name Gs2LogFacetModel
extends RefCounted


var facet_model_id = null
var field = null
var type = null
var display_name = null
var order = null


func with_facet_model_id(v) -> Gs2LogFacetModel:
    facet_model_id = v
    return self


func with_field(v) -> Gs2LogFacetModel:
    field = v
    return self


func with_type(v) -> Gs2LogFacetModel:
    type = v
    return self


func with_display_name(v) -> Gs2LogFacetModel:
    display_name = v
    return self


func with_order(v) -> Gs2LogFacetModel:
    order = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):model:facet:(?<field>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):model:facet:(?<field>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):model:facet:(?<field>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_field_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):log:(?<namespaceName>.+):model:facet:(?<field>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("field")


static func from_dict(data) -> Gs2LogFacetModel:
    if data == null:
        return null
    var ret = Gs2LogFacetModel.new()
    ret.facet_model_id = null if data.get("facetModelId") == null else str(data.get("facetModelId"))
    ret.field = null if data.get("field") == null else str(data.get("field"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.order = null if data.get("order") == null else int(data.get("order"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["facetModelId"] = facet_model_id
    ret["field"] = field
    ret["type"] = type
    ret["displayName"] = display_name
    ret["order"] = order
    return ret