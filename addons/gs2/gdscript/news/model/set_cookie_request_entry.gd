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
class_name Gs2NewsSetCookieRequestEntry
extends RefCounted


var key = null
var value = null


func with_key(v) -> Gs2NewsSetCookieRequestEntry:
    key = v
    return self


func with_value(v) -> Gs2NewsSetCookieRequestEntry:
    value = v
    return self


static func from_dict(data) -> Gs2NewsSetCookieRequestEntry:
    if data == null:
        return null
    var ret = Gs2NewsSetCookieRequestEntry.new()
    ret.key = null if data.get("key") == null else str(data.get("key"))
    ret.value = null if data.get("value") == null else str(data.get("value"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["key"] = key
    ret["value"] = value
    return ret