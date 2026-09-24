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
class_name Gs2DistributorCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var assume_user_id = null
var auto_run_stamp_sheet_notification = null
var auto_run_transaction_notification = null
var log_setting = null


func with_name(v) -> Gs2DistributorCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2DistributorCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DistributorCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2DistributorCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_assume_user_id(v) -> Gs2DistributorCreateNamespaceRequest:
    assume_user_id = v
    return self


func with_auto_run_stamp_sheet_notification(v) -> Gs2DistributorCreateNamespaceRequest:
    auto_run_stamp_sheet_notification = v
    return self


func with_auto_run_transaction_notification(v) -> Gs2DistributorCreateNamespaceRequest:
    auto_run_transaction_notification = v
    return self


func with_log_setting(v) -> Gs2DistributorCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2DistributorCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2DistributorCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DistributorTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2DistributorTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.assume_user_id = null if data.get("assumeUserId") == null else str(data.get("assumeUserId"))
    ret.auto_run_stamp_sheet_notification = null if data.get("autoRunStampSheetNotification") == null else Gs2DistributorNotificationSetting.from_dict(data.get("autoRunStampSheetNotification"))
    ret.auto_run_transaction_notification = null if data.get("autoRunTransactionNotification") == null else Gs2DistributorNotificationSetting.from_dict(data.get("autoRunTransactionNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DistributorLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["assumeUserId"] = assume_user_id
    ret["autoRunStampSheetNotification"] = null if auto_run_stamp_sheet_notification == null else auto_run_stamp_sheet_notification.to_dict()
    ret["autoRunTransactionNotification"] = null if auto_run_transaction_notification == null else auto_run_transaction_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret