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
class_name Gs2DatastoreUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var log_setting = null
var done_upload_script = null


func with_namespace_name(v) -> Gs2DatastoreUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2DatastoreUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DatastoreUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_log_setting(v) -> Gs2DatastoreUpdateNamespaceRequest:
    log_setting = v
    return self


func with_done_upload_script(v) -> Gs2DatastoreUpdateNamespaceRequest:
    done_upload_script = v
    return self


static func from_dict(data) -> Gs2DatastoreUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2DatastoreUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DatastoreTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DatastoreLogSetting.from_dict(data.get("logSetting"))
    ret.done_upload_script = null if data.get("doneUploadScript") == null else Gs2DatastoreScriptSetting.from_dict(data.get("doneUploadScript"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["doneUploadScript"] = null if done_upload_script == null else done_upload_script.to_dict()
    return ret