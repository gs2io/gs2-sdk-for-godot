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
class_name Gs2VersionAcceptRequest
extends Gs2Request


var namespace_name = null
var version_name = null
var access_token = null
var version = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2VersionAcceptRequest:
    namespace_name = v
    return self


func with_version_name(v) -> Gs2VersionAcceptRequest:
    version_name = v
    return self


func with_access_token(v) -> Gs2VersionAcceptRequest:
    access_token = v
    return self


func with_version(v) -> Gs2VersionAcceptRequest:
    version = v
    return self


func with_duplication_avoider(v) -> Gs2VersionAcceptRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2VersionAcceptRequest:
    if data == null:
        return null
    var ret = Gs2VersionAcceptRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.version_name = null if data.get("versionName") == null else str(data.get("versionName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.version = null if data.get("version") == null else Gs2VersionVersion.from_dict(data.get("version"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["versionName"] = version_name
    ret["accessToken"] = access_token
    ret["version"] = null if version == null else version.to_dict()
    return ret