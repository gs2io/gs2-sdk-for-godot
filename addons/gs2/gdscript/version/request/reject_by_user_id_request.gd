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
class_name Gs2VersionRejectByUserIdRequest
extends Gs2Request


var namespace_name = null
var version_name = null
var user_id = null
var version = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2VersionRejectByUserIdRequest:
    namespace_name = v
    return self


func with_version_name(v) -> Gs2VersionRejectByUserIdRequest:
    version_name = v
    return self


func with_user_id(v) -> Gs2VersionRejectByUserIdRequest:
    user_id = v
    return self


func with_version(v) -> Gs2VersionRejectByUserIdRequest:
    version = v
    return self


func with_time_offset_token(v) -> Gs2VersionRejectByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2VersionRejectByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2VersionRejectByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2VersionRejectByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.version_name = null if data.get("versionName") == null else str(data.get("versionName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.version = null if data.get("version") == null else Gs2VersionVersion.from_dict(data.get("version"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["versionName"] = version_name
    ret["userId"] = user_id
    ret["version"] = null if version == null else version.to_dict()
    ret["timeOffsetToken"] = time_offset_token
    return ret