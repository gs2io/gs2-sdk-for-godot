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
class_name Gs2AccountBanStatus
extends RefCounted


var name = null
var reason = null
var release_timestamp = null


func with_name(v) -> Gs2AccountBanStatus:
    name = v
    return self


func with_reason(v) -> Gs2AccountBanStatus:
    reason = v
    return self


func with_release_timestamp(v) -> Gs2AccountBanStatus:
    release_timestamp = v
    return self


static func from_dict(data) -> Gs2AccountBanStatus:
    if data == null:
        return null
    var ret = Gs2AccountBanStatus.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.reason = null if data.get("reason") == null else str(data.get("reason"))
    ret.release_timestamp = null if data.get("releaseTimestamp") == null else int(data.get("releaseTimestamp"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["reason"] = reason
    ret["releaseTimestamp"] = release_timestamp
    return ret