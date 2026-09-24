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
class_name Gs2EnhanceUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var enhance_script = null
var log_setting = null
var enable_direct_enhance = null
var queue_namespace_id = null
var key_id = null


func with_namespace_name(v) -> Gs2EnhanceUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2EnhanceUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2EnhanceUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2EnhanceUpdateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_enhance_script(v) -> Gs2EnhanceUpdateNamespaceRequest:
    enhance_script = v
    return self


func with_log_setting(v) -> Gs2EnhanceUpdateNamespaceRequest:
    log_setting = v
    return self


func with_enable_direct_enhance(v) -> Gs2EnhanceUpdateNamespaceRequest:
    enable_direct_enhance = v
    return self


func with_queue_namespace_id(v) -> Gs2EnhanceUpdateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2EnhanceUpdateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2EnhanceUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2EnhanceTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2EnhanceTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.enhance_script = null if data.get("enhanceScript") == null else Gs2EnhanceScriptSetting.from_dict(data.get("enhanceScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2EnhanceLogSetting.from_dict(data.get("logSetting"))
    ret.enable_direct_enhance = null if data.get("enableDirectEnhance") == null else bool(data.get("enableDirectEnhance"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["enhanceScript"] = null if enhance_script == null else enhance_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["enableDirectEnhance"] = enable_direct_enhance
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret