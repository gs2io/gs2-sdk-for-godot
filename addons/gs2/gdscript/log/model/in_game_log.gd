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
class_name Gs2LogInGameLog
extends RefCounted


var timestamp = null
var request_id = null
var user_id = null
var tags = null
var payload = null


func with_timestamp(v) -> Gs2LogInGameLog:
    timestamp = v
    return self


func with_request_id(v) -> Gs2LogInGameLog:
    request_id = v
    return self


func with_user_id(v) -> Gs2LogInGameLog:
    user_id = v
    return self


func with_tags(v) -> Gs2LogInGameLog:
    tags = v
    return self


func with_payload(v) -> Gs2LogInGameLog:
    payload = v
    return self


static func from_dict(data) -> Gs2LogInGameLog:
    if data == null:
        return null
    var ret = Gs2LogInGameLog.new()
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.request_id = null if data.get("requestId") == null else str(data.get("requestId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.tags = null if data.get("tags") == null else data.get("tags").map(func(v): return Gs2LogInGameLogTag.from_dict(v))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["timestamp"] = timestamp
    ret["requestId"] = request_id
    ret["userId"] = user_id
    ret["tags"] = null if tags == null else tags.map(func(v): return null if v == null else v.to_dict())
    ret["payload"] = payload
    return ret