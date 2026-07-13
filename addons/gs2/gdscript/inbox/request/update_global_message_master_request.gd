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
class_name Gs2InboxUpdateGlobalMessageMasterRequest
extends Gs2Request


var namespace_name = null
var global_message_name = null
var metadata = null
var read_acquire_actions = null
var expires_time_span = null
var expires_at = null
var message_reception_period_event_id = null


func with_namespace_name(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    namespace_name = v
    return self


func with_global_message_name(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    global_message_name = v
    return self


func with_metadata(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    metadata = v
    return self


func with_read_acquire_actions(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    read_acquire_actions = v
    return self


func with_expires_time_span(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    expires_time_span = v
    return self


func with_expires_at(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    expires_at = v
    return self


func with_message_reception_period_event_id(v) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    message_reception_period_event_id = v
    return self


static func from_dict(data) -> Gs2InboxUpdateGlobalMessageMasterRequest:
    if data == null:
        return null
    var ret = Gs2InboxUpdateGlobalMessageMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.global_message_name = null if data.get("globalMessageName") == null else str(data.get("globalMessageName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.read_acquire_actions = null if data.get("readAcquireActions") == null else data.get("readAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.expires_time_span = null if data.get("expiresTimeSpan") == null else Gs2InboxTimeSpan.from_dict(data.get("expiresTimeSpan"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.message_reception_period_event_id = null if data.get("messageReceptionPeriodEventId") == null else str(data.get("messageReceptionPeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["globalMessageName"] = global_message_name
    ret["metadata"] = metadata
    ret["readAcquireActions"] = null if read_acquire_actions == null else read_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["expiresTimeSpan"] = null if expires_time_span == null else expires_time_span.to_dict()
    ret["expiresAt"] = expires_at
    ret["messageReceptionPeriodEventId"] = message_reception_period_event_id
    return ret