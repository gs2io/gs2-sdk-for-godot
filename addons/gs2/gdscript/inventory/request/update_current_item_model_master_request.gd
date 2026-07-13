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
class_name Gs2InventoryUpdateCurrentItemModelMasterRequest
extends Gs2Request


var namespace_name = null
var mode = null
var settings = null
var upload_token = null


func with_namespace_name(v) -> Gs2InventoryUpdateCurrentItemModelMasterRequest:
    namespace_name = v
    return self


func with_mode(v) -> Gs2InventoryUpdateCurrentItemModelMasterRequest:
    mode = v
    return self


func with_settings(v) -> Gs2InventoryUpdateCurrentItemModelMasterRequest:
    settings = v
    return self


func with_upload_token(v) -> Gs2InventoryUpdateCurrentItemModelMasterRequest:
    upload_token = v
    return self


static func from_dict(data) -> Gs2InventoryUpdateCurrentItemModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2InventoryUpdateCurrentItemModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mode = null if data.get("mode") == null else str(data.get("mode"))
    ret.settings = null if data.get("settings") == null else str(data.get("settings"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["mode"] = mode
    ret["settings"] = settings
    ret["uploadToken"] = upload_token
    return ret