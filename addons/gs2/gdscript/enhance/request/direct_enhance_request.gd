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
class_name Gs2EnhanceDirectEnhanceRequest
extends Gs2Request


var namespace_name = null
var rate_name = null
var access_token = null
var target_item_set_id = null
var materials = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnhanceDirectEnhanceRequest:
    namespace_name = v
    return self


func with_rate_name(v) -> Gs2EnhanceDirectEnhanceRequest:
    rate_name = v
    return self


func with_access_token(v) -> Gs2EnhanceDirectEnhanceRequest:
    access_token = v
    return self


func with_target_item_set_id(v) -> Gs2EnhanceDirectEnhanceRequest:
    target_item_set_id = v
    return self


func with_materials(v) -> Gs2EnhanceDirectEnhanceRequest:
    materials = v
    return self


func with_config(v) -> Gs2EnhanceDirectEnhanceRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2EnhanceDirectEnhanceRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnhanceDirectEnhanceRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceDirectEnhanceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.target_item_set_id = null if data.get("targetItemSetId") == null else str(data.get("targetItemSetId"))
    ret.materials = null if data.get("materials") == null else data.get("materials").map(func(v): return Gs2EnhanceMaterial.from_dict(v))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2EnhanceConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rateName"] = rate_name
    ret["accessToken"] = access_token
    ret["targetItemSetId"] = target_item_set_id
    ret["materials"] = null if materials == null else materials.map(func(v): return null if v == null else v.to_dict())
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret