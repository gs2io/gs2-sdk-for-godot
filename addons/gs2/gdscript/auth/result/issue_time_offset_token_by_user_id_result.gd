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
class_name Gs2AuthIssueTimeOffsetTokenByUserIdResult
extends RefCounted


var token = null
var user_id = null
var expire = null
var metadata = null


func with_token(v) -> Gs2AuthIssueTimeOffsetTokenByUserIdResult:
    token = v
    return self


func with_user_id(v) -> Gs2AuthIssueTimeOffsetTokenByUserIdResult:
    user_id = v
    return self


func with_expire(v) -> Gs2AuthIssueTimeOffsetTokenByUserIdResult:
    expire = v
    return self


func with_metadata(v) -> Gs2AuthIssueTimeOffsetTokenByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2AuthIssueTimeOffsetTokenByUserIdResult:
    if data == null:
        return null
    var ret = Gs2AuthIssueTimeOffsetTokenByUserIdResult.new()
    ret.token = null if data.get("token") == null else str(data.get("token"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.expire = null if data.get("expire") == null else int(data.get("expire"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["token"] = token
    ret["userId"] = user_id
    ret["expire"] = expire
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret