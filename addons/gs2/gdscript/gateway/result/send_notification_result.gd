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
class_name Gs2GatewaySendNotificationResult
extends RefCounted


var protocol = null
var send_connection_ids = null
var metadata = null


func with_protocol(v) -> Gs2GatewaySendNotificationResult:
    protocol = v
    return self


func with_send_connection_ids(v) -> Gs2GatewaySendNotificationResult:
    send_connection_ids = v
    return self


func with_metadata(v) -> Gs2GatewaySendNotificationResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2GatewaySendNotificationResult:
    if data == null:
        return null
    var ret = Gs2GatewaySendNotificationResult.new()
    ret.protocol = null if data.get("protocol") == null else str(data.get("protocol"))
    ret.send_connection_ids = null if data.get("sendConnectionIds") == null else data.get("sendConnectionIds").map(func(v): return str(v))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["protocol"] = protocol
    ret["sendConnectionIds"] = send_connection_ids
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret