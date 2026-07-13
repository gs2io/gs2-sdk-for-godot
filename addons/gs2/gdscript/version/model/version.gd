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
class_name Gs2VersionVersion
extends RefCounted


var major = null
var minor = null
var micro = null


func with_major(v) -> Gs2VersionVersion:
    major = v
    return self


func with_minor(v) -> Gs2VersionVersion:
    minor = v
    return self


func with_micro(v) -> Gs2VersionVersion:
    micro = v
    return self


static func from_dict(data) -> Gs2VersionVersion:
    if data == null:
        return null
    var ret = Gs2VersionVersion.new()
    ret.major = null if data.get("major") == null else int(data.get("major"))
    ret.minor = null if data.get("minor") == null else int(data.get("minor"))
    ret.micro = null if data.get("micro") == null else int(data.get("micro"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["major"] = major
    ret["minor"] = minor
    ret["micro"] = micro
    return ret