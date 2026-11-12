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
class_name Gs2AccountCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var change_password_if_take_over = null
var different_user_id_for_login_and_data_retention = null
var create_account_script = null
var authentication_script = null
var create_take_over_script = null
var do_take_over_script = null
var ban_script = null
var un_ban_script = null
var account_deletion_setting = null
var request_deletion_script = null
var cancel_deletion_script = null
var execute_deletion_script = null
var log_setting = null


func with_name(v) -> Gs2AccountCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2AccountCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2AccountCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2AccountCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_change_password_if_take_over(v) -> Gs2AccountCreateNamespaceRequest:
    change_password_if_take_over = v
    return self


func with_different_user_id_for_login_and_data_retention(v) -> Gs2AccountCreateNamespaceRequest:
    different_user_id_for_login_and_data_retention = v
    return self


func with_create_account_script(v) -> Gs2AccountCreateNamespaceRequest:
    create_account_script = v
    return self


func with_authentication_script(v) -> Gs2AccountCreateNamespaceRequest:
    authentication_script = v
    return self


func with_create_take_over_script(v) -> Gs2AccountCreateNamespaceRequest:
    create_take_over_script = v
    return self


func with_do_take_over_script(v) -> Gs2AccountCreateNamespaceRequest:
    do_take_over_script = v
    return self


func with_ban_script(v) -> Gs2AccountCreateNamespaceRequest:
    ban_script = v
    return self


func with_un_ban_script(v) -> Gs2AccountCreateNamespaceRequest:
    un_ban_script = v
    return self


func with_account_deletion_setting(v) -> Gs2AccountCreateNamespaceRequest:
    account_deletion_setting = v
    return self


func with_request_deletion_script(v) -> Gs2AccountCreateNamespaceRequest:
    request_deletion_script = v
    return self


func with_cancel_deletion_script(v) -> Gs2AccountCreateNamespaceRequest:
    cancel_deletion_script = v
    return self


func with_execute_deletion_script(v) -> Gs2AccountCreateNamespaceRequest:
    execute_deletion_script = v
    return self


func with_log_setting(v) -> Gs2AccountCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2AccountCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2AccountCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2AccountTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2AccountTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.change_password_if_take_over = null if data.get("changePasswordIfTakeOver") == null else bool(data.get("changePasswordIfTakeOver"))
    ret.different_user_id_for_login_and_data_retention = null if data.get("differentUserIdForLoginAndDataRetention") == null else bool(data.get("differentUserIdForLoginAndDataRetention"))
    ret.create_account_script = null if data.get("createAccountScript") == null else Gs2AccountScriptSetting.from_dict(data.get("createAccountScript"))
    ret.authentication_script = null if data.get("authenticationScript") == null else Gs2AccountScriptSetting.from_dict(data.get("authenticationScript"))
    ret.create_take_over_script = null if data.get("createTakeOverScript") == null else Gs2AccountScriptSetting.from_dict(data.get("createTakeOverScript"))
    ret.do_take_over_script = null if data.get("doTakeOverScript") == null else Gs2AccountScriptSetting.from_dict(data.get("doTakeOverScript"))
    ret.ban_script = null if data.get("banScript") == null else Gs2AccountScriptSetting.from_dict(data.get("banScript"))
    ret.un_ban_script = null if data.get("unBanScript") == null else Gs2AccountScriptSetting.from_dict(data.get("unBanScript"))
    ret.account_deletion_setting = null if data.get("accountDeletionSetting") == null else Gs2AccountAccountDeletionSetting.from_dict(data.get("accountDeletionSetting"))
    ret.request_deletion_script = null if data.get("requestDeletionScript") == null else Gs2AccountScriptSetting.from_dict(data.get("requestDeletionScript"))
    ret.cancel_deletion_script = null if data.get("cancelDeletionScript") == null else Gs2AccountScriptSetting.from_dict(data.get("cancelDeletionScript"))
    ret.execute_deletion_script = null if data.get("executeDeletionScript") == null else Gs2AccountScriptSetting.from_dict(data.get("executeDeletionScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2AccountLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["changePasswordIfTakeOver"] = change_password_if_take_over
    ret["differentUserIdForLoginAndDataRetention"] = different_user_id_for_login_and_data_retention
    ret["createAccountScript"] = null if create_account_script == null else create_account_script.to_dict()
    ret["authenticationScript"] = null if authentication_script == null else authentication_script.to_dict()
    ret["createTakeOverScript"] = null if create_take_over_script == null else create_take_over_script.to_dict()
    ret["doTakeOverScript"] = null if do_take_over_script == null else do_take_over_script.to_dict()
    ret["banScript"] = null if ban_script == null else ban_script.to_dict()
    ret["unBanScript"] = null if un_ban_script == null else un_ban_script.to_dict()
    ret["accountDeletionSetting"] = null if account_deletion_setting == null else account_deletion_setting.to_dict()
    ret["requestDeletionScript"] = null if request_deletion_script == null else request_deletion_script.to_dict()
    ret["cancelDeletionScript"] = null if cancel_deletion_script == null else cancel_deletion_script.to_dict()
    ret["executeDeletionScript"] = null if execute_deletion_script == null else execute_deletion_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret