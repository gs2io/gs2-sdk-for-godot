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
class_name Gs2AccountEzBanStatus
extends RefCounted


var name = null
var reason = null
var release_timestamp = 0


func with_name(v) -> Gs2AccountEzBanStatus:
    name = v
    return self


func with_reason(v) -> Gs2AccountEzBanStatus:
    reason = v
    return self


func with_release_timestamp(v) -> Gs2AccountEzBanStatus:
    release_timestamp = v
    return self


func to_model() -> Gs2AccountBanStatus:
    var ret = Gs2AccountBanStatus.new()
    ret.name = name
    ret.reason = reason
    ret.release_timestamp = release_timestamp
    return ret


static func from_model(model) -> Gs2AccountEzBanStatus:
    var ret = Gs2AccountEzBanStatus.new()
    ret.name = model.name
    ret.reason = model.reason
    ret.release_timestamp = 0 if model.release_timestamp == null else model.release_timestamp
    return ret