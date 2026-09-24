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
class_name Gs2ShowcaseCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var buy_script = null
var queue_namespace_id = null
var key_id = null
var log_setting = null


func with_name(v) -> Gs2ShowcaseCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2ShowcaseCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2ShowcaseCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2ShowcaseCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_buy_script(v) -> Gs2ShowcaseCreateNamespaceRequest:
    buy_script = v
    return self


func with_queue_namespace_id(v) -> Gs2ShowcaseCreateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2ShowcaseCreateNamespaceRequest:
    key_id = v
    return self


func with_log_setting(v) -> Gs2ShowcaseCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2ShowcaseCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2ShowcaseTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2ShowcaseTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.buy_script = null if data.get("buyScript") == null else Gs2ShowcaseScriptSetting.from_dict(data.get("buyScript"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2ShowcaseLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["buyScript"] = null if buy_script == null else buy_script.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret