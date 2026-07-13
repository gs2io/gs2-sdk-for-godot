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
class_name Gs2VersionEzVersion
extends RefCounted


var major = 0
var minor = 0
var micro = 0


func with_major(v) -> Gs2VersionEzVersion:
    major = v
    return self


func with_minor(v) -> Gs2VersionEzVersion:
    minor = v
    return self


func with_micro(v) -> Gs2VersionEzVersion:
    micro = v
    return self


func to_model() -> Gs2VersionVersion:
    var ret = Gs2VersionVersion.new()
    ret.major = major
    ret.minor = minor
    ret.micro = micro
    return ret


static func from_model(model) -> Gs2VersionEzVersion:
    var ret = Gs2VersionEzVersion.new()
    ret.major = 0 if model.major == null else model.major
    ret.minor = 0 if model.minor == null else model.minor
    ret.micro = 0 if model.micro == null else model.micro
    return ret