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
class_name Gs2VersionCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var assume_user_id = null
var accept_version_script = null
var check_version_trigger_script_id = null
var log_setting = null


func with_name(v) -> Gs2VersionCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2VersionCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2VersionCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2VersionCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_assume_user_id(v) -> Gs2VersionCreateNamespaceRequest:
    assume_user_id = v
    return self


func with_accept_version_script(v) -> Gs2VersionCreateNamespaceRequest:
    accept_version_script = v
    return self


func with_check_version_trigger_script_id(v) -> Gs2VersionCreateNamespaceRequest:
    check_version_trigger_script_id = v
    return self


func with_log_setting(v) -> Gs2VersionCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2VersionCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2VersionCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2VersionTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2VersionTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.assume_user_id = null if data.get("assumeUserId") == null else str(data.get("assumeUserId"))
    ret.accept_version_script = null if data.get("acceptVersionScript") == null else Gs2VersionScriptSetting.from_dict(data.get("acceptVersionScript"))
    ret.check_version_trigger_script_id = null if data.get("checkVersionTriggerScriptId") == null else str(data.get("checkVersionTriggerScriptId"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2VersionLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["assumeUserId"] = assume_user_id
    ret["acceptVersionScript"] = null if accept_version_script == null else accept_version_script.to_dict()
    ret["checkVersionTriggerScriptId"] = check_version_trigger_script_id
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret