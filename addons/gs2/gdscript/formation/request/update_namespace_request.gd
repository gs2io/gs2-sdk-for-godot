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
class_name Gs2FormationUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var update_mold_script = null
var update_form_script = null
var update_property_form_script = null
var log_setting = null


func with_namespace_name(v) -> Gs2FormationUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2FormationUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2FormationUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_update_mold_script(v) -> Gs2FormationUpdateNamespaceRequest:
    update_mold_script = v
    return self


func with_update_form_script(v) -> Gs2FormationUpdateNamespaceRequest:
    update_form_script = v
    return self


func with_update_property_form_script(v) -> Gs2FormationUpdateNamespaceRequest:
    update_property_form_script = v
    return self


func with_log_setting(v) -> Gs2FormationUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2FormationUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2FormationUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2FormationTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.update_mold_script = null if data.get("updateMoldScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updateMoldScript"))
    ret.update_form_script = null if data.get("updateFormScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updateFormScript"))
    ret.update_property_form_script = null if data.get("updatePropertyFormScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updatePropertyFormScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2FormationLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["updateMoldScript"] = null if update_mold_script == null else update_mold_script.to_dict()
    ret["updateFormScript"] = null if update_form_script == null else update_form_script.to_dict()
    ret["updatePropertyFormScript"] = null if update_property_form_script == null else update_property_form_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret