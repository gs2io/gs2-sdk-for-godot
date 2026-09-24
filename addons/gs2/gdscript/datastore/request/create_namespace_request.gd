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
class_name Gs2DatastoreCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var log_setting = null
var done_upload_script = null


func with_name(v) -> Gs2DatastoreCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2DatastoreCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DatastoreCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2DatastoreCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_log_setting(v) -> Gs2DatastoreCreateNamespaceRequest:
    log_setting = v
    return self


func with_done_upload_script(v) -> Gs2DatastoreCreateNamespaceRequest:
    done_upload_script = v
    return self


static func from_dict(data) -> Gs2DatastoreCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2DatastoreCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DatastoreTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2DatastoreTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DatastoreLogSetting.from_dict(data.get("logSetting"))
    ret.done_upload_script = null if data.get("doneUploadScript") == null else Gs2DatastoreScriptSetting.from_dict(data.get("doneUploadScript"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["doneUploadScript"] = null if done_upload_script == null else done_upload_script.to_dict()
    return ret