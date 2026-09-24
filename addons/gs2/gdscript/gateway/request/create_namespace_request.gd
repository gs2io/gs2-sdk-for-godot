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
class_name Gs2GatewayCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var firebase_secret = null
var firebase_project_id = null
var log_setting = null


func with_name(v) -> Gs2GatewayCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2GatewayCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2GatewayCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2GatewayCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_firebase_secret(v) -> Gs2GatewayCreateNamespaceRequest:
    firebase_secret = v
    return self


func with_firebase_project_id(v) -> Gs2GatewayCreateNamespaceRequest:
    firebase_project_id = v
    return self


func with_log_setting(v) -> Gs2GatewayCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2GatewayCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2GatewayCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2GatewayTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2GatewayTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.firebase_secret = null if data.get("firebaseSecret") == null else str(data.get("firebaseSecret"))
    ret.firebase_project_id = null if data.get("firebaseProjectId") == null else str(data.get("firebaseProjectId"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2GatewayLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["firebaseSecret"] = firebase_secret
    ret["firebaseProjectId"] = firebase_project_id
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret