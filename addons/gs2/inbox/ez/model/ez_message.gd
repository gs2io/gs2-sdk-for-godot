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
class_name Gs2InboxEzMessage
extends RefCounted


var message_id = null
var name = null
var metadata = null
var is_read = false
var read_acquire_actions = []
var received_at = 0
var read_at = 0
var expires_at = 0


func with_message_id(v) -> Gs2InboxEzMessage:
    message_id = v
    return self


func with_name(v) -> Gs2InboxEzMessage:
    name = v
    return self


func with_metadata(v) -> Gs2InboxEzMessage:
    metadata = v
    return self


func with_is_read(v) -> Gs2InboxEzMessage:
    is_read = v
    return self


func with_read_acquire_actions(v) -> Gs2InboxEzMessage:
    read_acquire_actions = v
    return self


func with_received_at(v) -> Gs2InboxEzMessage:
    received_at = v
    return self


func with_read_at(v) -> Gs2InboxEzMessage:
    read_at = v
    return self


func with_expires_at(v) -> Gs2InboxEzMessage:
    expires_at = v
    return self


func to_model() -> Gs2InboxMessage:
    var ret = Gs2InboxMessage.new()
    ret.message_id = message_id
    ret.name = name
    ret.metadata = metadata
    ret.is_read = is_read
    ret.read_acquire_actions = null if read_acquire_actions == null else read_acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.received_at = received_at
    ret.read_at = read_at
    ret.expires_at = expires_at
    return ret


static func from_model(model) -> Gs2InboxEzMessage:
    var ret = Gs2InboxEzMessage.new()
    ret.message_id = model.message_id
    ret.name = model.name
    ret.metadata = model.metadata
    ret.is_read = false if model.is_read == null else model.is_read
    ret.read_acquire_actions = [] if model.read_acquire_actions == null else model.read_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.received_at = 0 if model.received_at == null else model.received_at
    ret.read_at = 0 if model.read_at == null else model.read_at
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    return ret