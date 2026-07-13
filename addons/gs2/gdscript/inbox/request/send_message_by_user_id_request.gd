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
class_name Gs2InboxSendMessageByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var metadata = null
var read_acquire_actions = null
var expires_at = null
var expires_time_span = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2InboxSendMessageByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2InboxSendMessageByUserIdRequest:
    user_id = v
    return self


func with_metadata(v) -> Gs2InboxSendMessageByUserIdRequest:
    metadata = v
    return self


func with_read_acquire_actions(v) -> Gs2InboxSendMessageByUserIdRequest:
    read_acquire_actions = v
    return self


func with_expires_at(v) -> Gs2InboxSendMessageByUserIdRequest:
    expires_at = v
    return self


func with_expires_time_span(v) -> Gs2InboxSendMessageByUserIdRequest:
    expires_time_span = v
    return self


func with_time_offset_token(v) -> Gs2InboxSendMessageByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2InboxSendMessageByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2InboxSendMessageByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2InboxSendMessageByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.read_acquire_actions = null if data.get("readAcquireActions") == null else data.get("readAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.expires_time_span = null if data.get("expiresTimeSpan") == null else Gs2InboxTimeSpan.from_dict(data.get("expiresTimeSpan"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["metadata"] = metadata
    ret["readAcquireActions"] = null if read_acquire_actions == null else read_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["expiresAt"] = expires_at
    ret["expiresTimeSpan"] = null if expires_time_span == null else expires_time_span.to_dict()
    ret["timeOffsetToken"] = time_offset_token
    return ret