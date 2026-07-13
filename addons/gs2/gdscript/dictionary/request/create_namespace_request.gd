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
class_name Gs2DictionaryCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var entry_script = null
var duplicate_entry_script = null
var log_setting = null


func with_name(v) -> Gs2DictionaryCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2DictionaryCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DictionaryCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_entry_script(v) -> Gs2DictionaryCreateNamespaceRequest:
    entry_script = v
    return self


func with_duplicate_entry_script(v) -> Gs2DictionaryCreateNamespaceRequest:
    duplicate_entry_script = v
    return self


func with_log_setting(v) -> Gs2DictionaryCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2DictionaryCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2DictionaryCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DictionaryTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.entry_script = null if data.get("entryScript") == null else Gs2DictionaryScriptSetting.from_dict(data.get("entryScript"))
    ret.duplicate_entry_script = null if data.get("duplicateEntryScript") == null else str(data.get("duplicateEntryScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DictionaryLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["entryScript"] = null if entry_script == null else entry_script.to_dict()
    ret["duplicateEntryScript"] = duplicate_entry_script
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret