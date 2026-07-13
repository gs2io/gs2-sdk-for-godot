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
class_name Gs2SerialKeyUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var log_setting = null


func with_namespace_name(v) -> Gs2SerialKeyUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2SerialKeyUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2SerialKeyUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_log_setting(v) -> Gs2SerialKeyUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2SerialKeyUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2SerialKeyUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2SerialKeyTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2SerialKeyLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret