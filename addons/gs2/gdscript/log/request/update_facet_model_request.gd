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
class_name Gs2LogUpdateFacetModelRequest
extends Gs2Request


var namespace_name = null
var field = null
var type = null
var display_name = null
var order = null


func with_namespace_name(v) -> Gs2LogUpdateFacetModelRequest:
    namespace_name = v
    return self


func with_field(v) -> Gs2LogUpdateFacetModelRequest:
    field = v
    return self


func with_type(v) -> Gs2LogUpdateFacetModelRequest:
    type = v
    return self


func with_display_name(v) -> Gs2LogUpdateFacetModelRequest:
    display_name = v
    return self


func with_order(v) -> Gs2LogUpdateFacetModelRequest:
    order = v
    return self


static func from_dict(data) -> Gs2LogUpdateFacetModelRequest:
    if data == null:
        return null
    var ret = Gs2LogUpdateFacetModelRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.field = null if data.get("field") == null else str(data.get("field"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.order = null if data.get("order") == null else int(data.get("order"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["field"] = field
    ret["type"] = type
    ret["displayName"] = display_name
    ret["order"] = order
    return ret