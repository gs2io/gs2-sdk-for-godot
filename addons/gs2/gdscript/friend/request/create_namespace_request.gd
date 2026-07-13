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
class_name Gs2FriendCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var follow_script = null
var unfollow_script = null
var send_request_script = null
var cancel_request_script = null
var accept_request_script = null
var reject_request_script = null
var delete_friend_script = null
var update_profile_script = null
var follow_notification = null
var receive_request_notification = null
var cancel_request_notification = null
var accept_request_notification = null
var reject_request_notification = null
var delete_friend_notification = null
var log_setting = null


func with_name(v) -> Gs2FriendCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2FriendCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2FriendCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_follow_script(v) -> Gs2FriendCreateNamespaceRequest:
    follow_script = v
    return self


func with_unfollow_script(v) -> Gs2FriendCreateNamespaceRequest:
    unfollow_script = v
    return self


func with_send_request_script(v) -> Gs2FriendCreateNamespaceRequest:
    send_request_script = v
    return self


func with_cancel_request_script(v) -> Gs2FriendCreateNamespaceRequest:
    cancel_request_script = v
    return self


func with_accept_request_script(v) -> Gs2FriendCreateNamespaceRequest:
    accept_request_script = v
    return self


func with_reject_request_script(v) -> Gs2FriendCreateNamespaceRequest:
    reject_request_script = v
    return self


func with_delete_friend_script(v) -> Gs2FriendCreateNamespaceRequest:
    delete_friend_script = v
    return self


func with_update_profile_script(v) -> Gs2FriendCreateNamespaceRequest:
    update_profile_script = v
    return self


func with_follow_notification(v) -> Gs2FriendCreateNamespaceRequest:
    follow_notification = v
    return self


func with_receive_request_notification(v) -> Gs2FriendCreateNamespaceRequest:
    receive_request_notification = v
    return self


func with_cancel_request_notification(v) -> Gs2FriendCreateNamespaceRequest:
    cancel_request_notification = v
    return self


func with_accept_request_notification(v) -> Gs2FriendCreateNamespaceRequest:
    accept_request_notification = v
    return self


func with_reject_request_notification(v) -> Gs2FriendCreateNamespaceRequest:
    reject_request_notification = v
    return self


func with_delete_friend_notification(v) -> Gs2FriendCreateNamespaceRequest:
    delete_friend_notification = v
    return self


func with_log_setting(v) -> Gs2FriendCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2FriendCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2FriendCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2FriendTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.follow_script = null if data.get("followScript") == null else Gs2FriendScriptSetting.from_dict(data.get("followScript"))
    ret.unfollow_script = null if data.get("unfollowScript") == null else Gs2FriendScriptSetting.from_dict(data.get("unfollowScript"))
    ret.send_request_script = null if data.get("sendRequestScript") == null else Gs2FriendScriptSetting.from_dict(data.get("sendRequestScript"))
    ret.cancel_request_script = null if data.get("cancelRequestScript") == null else Gs2FriendScriptSetting.from_dict(data.get("cancelRequestScript"))
    ret.accept_request_script = null if data.get("acceptRequestScript") == null else Gs2FriendScriptSetting.from_dict(data.get("acceptRequestScript"))
    ret.reject_request_script = null if data.get("rejectRequestScript") == null else Gs2FriendScriptSetting.from_dict(data.get("rejectRequestScript"))
    ret.delete_friend_script = null if data.get("deleteFriendScript") == null else Gs2FriendScriptSetting.from_dict(data.get("deleteFriendScript"))
    ret.update_profile_script = null if data.get("updateProfileScript") == null else Gs2FriendScriptSetting.from_dict(data.get("updateProfileScript"))
    ret.follow_notification = null if data.get("followNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("followNotification"))
    ret.receive_request_notification = null if data.get("receiveRequestNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("receiveRequestNotification"))
    ret.cancel_request_notification = null if data.get("cancelRequestNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("cancelRequestNotification"))
    ret.accept_request_notification = null if data.get("acceptRequestNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("acceptRequestNotification"))
    ret.reject_request_notification = null if data.get("rejectRequestNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("rejectRequestNotification"))
    ret.delete_friend_notification = null if data.get("deleteFriendNotification") == null else Gs2FriendNotificationSetting.from_dict(data.get("deleteFriendNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2FriendLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["followScript"] = null if follow_script == null else follow_script.to_dict()
    ret["unfollowScript"] = null if unfollow_script == null else unfollow_script.to_dict()
    ret["sendRequestScript"] = null if send_request_script == null else send_request_script.to_dict()
    ret["cancelRequestScript"] = null if cancel_request_script == null else cancel_request_script.to_dict()
    ret["acceptRequestScript"] = null if accept_request_script == null else accept_request_script.to_dict()
    ret["rejectRequestScript"] = null if reject_request_script == null else reject_request_script.to_dict()
    ret["deleteFriendScript"] = null if delete_friend_script == null else delete_friend_script.to_dict()
    ret["updateProfileScript"] = null if update_profile_script == null else update_profile_script.to_dict()
    ret["followNotification"] = null if follow_notification == null else follow_notification.to_dict()
    ret["receiveRequestNotification"] = null if receive_request_notification == null else receive_request_notification.to_dict()
    ret["cancelRequestNotification"] = null if cancel_request_notification == null else cancel_request_notification.to_dict()
    ret["acceptRequestNotification"] = null if accept_request_notification == null else accept_request_notification.to_dict()
    ret["rejectRequestNotification"] = null if reject_request_notification == null else reject_request_notification.to_dict()
    ret["deleteFriendNotification"] = null if delete_friend_notification == null else delete_friend_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret