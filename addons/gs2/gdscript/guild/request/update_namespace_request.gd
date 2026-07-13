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
class_name Gs2GuildUpdateNamespaceRequest
extends Gs2Request


var namespace_name = null
var description = null
var transaction_setting = null
var change_notification = null
var join_notification = null
var leave_notification = null
var change_member_notification = null
var change_member_notification_ignore_change_metadata = null
var receive_request_notification = null
var remove_request_notification = null
var create_guild_script = null
var update_guild_script = null
var join_guild_script = null
var receive_join_request_script = null
var leave_guild_script = null
var change_role_script = null
var delete_guild_script = null
var log_setting = null


func with_namespace_name(v) -> Gs2GuildUpdateNamespaceRequest:
    namespace_name = v
    return self


func with_description(v) -> Gs2GuildUpdateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2GuildUpdateNamespaceRequest:
    transaction_setting = v
    return self


func with_change_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    change_notification = v
    return self


func with_join_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    join_notification = v
    return self


func with_leave_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    leave_notification = v
    return self


func with_change_member_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    change_member_notification = v
    return self


func with_change_member_notification_ignore_change_metadata(v) -> Gs2GuildUpdateNamespaceRequest:
    change_member_notification_ignore_change_metadata = v
    return self


func with_receive_request_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    receive_request_notification = v
    return self


func with_remove_request_notification(v) -> Gs2GuildUpdateNamespaceRequest:
    remove_request_notification = v
    return self


func with_create_guild_script(v) -> Gs2GuildUpdateNamespaceRequest:
    create_guild_script = v
    return self


func with_update_guild_script(v) -> Gs2GuildUpdateNamespaceRequest:
    update_guild_script = v
    return self


func with_join_guild_script(v) -> Gs2GuildUpdateNamespaceRequest:
    join_guild_script = v
    return self


func with_receive_join_request_script(v) -> Gs2GuildUpdateNamespaceRequest:
    receive_join_request_script = v
    return self


func with_leave_guild_script(v) -> Gs2GuildUpdateNamespaceRequest:
    leave_guild_script = v
    return self


func with_change_role_script(v) -> Gs2GuildUpdateNamespaceRequest:
    change_role_script = v
    return self


func with_delete_guild_script(v) -> Gs2GuildUpdateNamespaceRequest:
    delete_guild_script = v
    return self


func with_log_setting(v) -> Gs2GuildUpdateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2GuildUpdateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2GuildUpdateNamespaceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2GuildTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.change_notification = null if data.get("changeNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("changeNotification"))
    ret.join_notification = null if data.get("joinNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("joinNotification"))
    ret.leave_notification = null if data.get("leaveNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("leaveNotification"))
    ret.change_member_notification = null if data.get("changeMemberNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("changeMemberNotification"))
    ret.change_member_notification_ignore_change_metadata = null if data.get("changeMemberNotificationIgnoreChangeMetadata") == null else bool(data.get("changeMemberNotificationIgnoreChangeMetadata"))
    ret.receive_request_notification = null if data.get("receiveRequestNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("receiveRequestNotification"))
    ret.remove_request_notification = null if data.get("removeRequestNotification") == null else Gs2GuildNotificationSetting.from_dict(data.get("removeRequestNotification"))
    ret.create_guild_script = null if data.get("createGuildScript") == null else Gs2GuildScriptSetting.from_dict(data.get("createGuildScript"))
    ret.update_guild_script = null if data.get("updateGuildScript") == null else Gs2GuildScriptSetting.from_dict(data.get("updateGuildScript"))
    ret.join_guild_script = null if data.get("joinGuildScript") == null else Gs2GuildScriptSetting.from_dict(data.get("joinGuildScript"))
    ret.receive_join_request_script = null if data.get("receiveJoinRequestScript") == null else Gs2GuildScriptSetting.from_dict(data.get("receiveJoinRequestScript"))
    ret.leave_guild_script = null if data.get("leaveGuildScript") == null else Gs2GuildScriptSetting.from_dict(data.get("leaveGuildScript"))
    ret.change_role_script = null if data.get("changeRoleScript") == null else Gs2GuildScriptSetting.from_dict(data.get("changeRoleScript"))
    ret.delete_guild_script = null if data.get("deleteGuildScript") == null else Gs2GuildScriptSetting.from_dict(data.get("deleteGuildScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2GuildLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["changeNotification"] = null if change_notification == null else change_notification.to_dict()
    ret["joinNotification"] = null if join_notification == null else join_notification.to_dict()
    ret["leaveNotification"] = null if leave_notification == null else leave_notification.to_dict()
    ret["changeMemberNotification"] = null if change_member_notification == null else change_member_notification.to_dict()
    ret["changeMemberNotificationIgnoreChangeMetadata"] = change_member_notification_ignore_change_metadata
    ret["receiveRequestNotification"] = null if receive_request_notification == null else receive_request_notification.to_dict()
    ret["removeRequestNotification"] = null if remove_request_notification == null else remove_request_notification.to_dict()
    ret["createGuildScript"] = null if create_guild_script == null else create_guild_script.to_dict()
    ret["updateGuildScript"] = null if update_guild_script == null else update_guild_script.to_dict()
    ret["joinGuildScript"] = null if join_guild_script == null else join_guild_script.to_dict()
    ret["receiveJoinRequestScript"] = null if receive_join_request_script == null else receive_join_request_script.to_dict()
    ret["leaveGuildScript"] = null if leave_guild_script == null else leave_guild_script.to_dict()
    ret["changeRoleScript"] = null if change_role_script == null else change_role_script.to_dict()
    ret["deleteGuildScript"] = null if delete_guild_script == null else delete_guild_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret