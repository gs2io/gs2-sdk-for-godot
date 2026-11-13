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
class_name Gs2AccountUpdateTakeOverTypeModelMasterRequest
extends Gs2Request


var namespace_name = null
var type = null
var description = null
var metadata = null
var take_over_method = null
var open_id_connect_setting = null
var issued_code_setting = null


func with_namespace_name(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    namespace_name = v
    return self


func with_type(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    type = v
    return self


func with_description(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    metadata = v
    return self


func with_take_over_method(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    take_over_method = v
    return self


func with_open_id_connect_setting(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    open_id_connect_setting = v
    return self


func with_issued_code_setting(v) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    issued_code_setting = v
    return self


static func from_dict(data) -> Gs2AccountUpdateTakeOverTypeModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2AccountUpdateTakeOverTypeModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.type = null if data.get("type") == null else int(data.get("type"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.take_over_method = null if data.get("takeOverMethod") == null else str(data.get("takeOverMethod"))
    ret.open_id_connect_setting = null if data.get("openIdConnectSetting") == null else Gs2AccountOpenIdConnectSetting.from_dict(data.get("openIdConnectSetting"))
    ret.issued_code_setting = null if data.get("issuedCodeSetting") == null else Gs2AccountIssuedCodeSetting.from_dict(data.get("issuedCodeSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["type"] = type
    ret["description"] = description
    ret["metadata"] = metadata
    ret["takeOverMethod"] = take_over_method
    ret["openIdConnectSetting"] = null if open_id_connect_setting == null else open_id_connect_setting.to_dict()
    ret["issuedCodeSetting"] = null if issued_code_setting == null else issued_code_setting.to_dict()
    return ret