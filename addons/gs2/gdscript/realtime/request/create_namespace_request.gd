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
class_name Gs2RealtimeCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var server_type = null
var server_spec = null
var create_notification = null
var log_setting = null


func with_name(v) -> Gs2RealtimeCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2RealtimeCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2RealtimeCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_server_type(v) -> Gs2RealtimeCreateNamespaceRequest:
    server_type = v
    return self


func with_server_spec(v) -> Gs2RealtimeCreateNamespaceRequest:
    server_spec = v
    return self


func with_create_notification(v) -> Gs2RealtimeCreateNamespaceRequest:
    create_notification = v
    return self


func with_log_setting(v) -> Gs2RealtimeCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2RealtimeCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2RealtimeCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2RealtimeTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.server_type = null if data.get("serverType") == null else str(data.get("serverType"))
    ret.server_spec = null if data.get("serverSpec") == null else str(data.get("serverSpec"))
    ret.create_notification = null if data.get("createNotification") == null else Gs2RealtimeNotificationSetting.from_dict(data.get("createNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2RealtimeLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["serverType"] = server_type
    ret["serverSpec"] = server_spec
    ret["createNotification"] = null if create_notification == null else create_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret