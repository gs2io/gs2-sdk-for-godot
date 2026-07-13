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
class_name Gs2GuildCheckImportUserDataByUserIdRequest
extends Gs2Request


var user_id = null
var upload_token = null
var time_offset_token = null


func with_user_id(v) -> Gs2GuildCheckImportUserDataByUserIdRequest:
    user_id = v
    return self


func with_upload_token(v) -> Gs2GuildCheckImportUserDataByUserIdRequest:
    upload_token = v
    return self


func with_time_offset_token(v) -> Gs2GuildCheckImportUserDataByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2GuildCheckImportUserDataByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2GuildCheckImportUserDataByUserIdRequest.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["uploadToken"] = upload_token
    ret["timeOffsetToken"] = time_offset_token
    return ret