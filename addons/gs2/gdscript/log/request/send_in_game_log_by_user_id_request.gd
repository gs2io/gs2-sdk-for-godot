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
class_name Gs2LogSendInGameLogByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var tags = null
var payload = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LogSendInGameLogByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2LogSendInGameLogByUserIdRequest:
    user_id = v
    return self


func with_tags(v) -> Gs2LogSendInGameLogByUserIdRequest:
    tags = v
    return self


func with_payload(v) -> Gs2LogSendInGameLogByUserIdRequest:
    payload = v
    return self


func with_time_offset_token(v) -> Gs2LogSendInGameLogByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2LogSendInGameLogByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LogSendInGameLogByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2LogSendInGameLogByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.tags = null if data.get("tags") == null else data.get("tags").map(func(v): return Gs2LogInGameLogTag.from_dict(v))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["tags"] = null if tags == null else tags.map(func(v): return null if v == null else v.to_dict())
    ret["payload"] = payload
    ret["timeOffsetToken"] = time_offset_token
    return ret