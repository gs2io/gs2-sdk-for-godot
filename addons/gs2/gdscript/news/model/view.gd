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
class_name Gs2NewsView
extends RefCounted


var contents = null
var remove_contents = null


func with_contents(v) -> Gs2NewsView:
    contents = v
    return self


func with_remove_contents(v) -> Gs2NewsView:
    remove_contents = v
    return self


static func from_dict(data) -> Gs2NewsView:
    if data == null:
        return null
    var ret = Gs2NewsView.new()
    ret.contents = null if data.get("contents") == null else data.get("contents").map(func(v): return Gs2NewsContent.from_dict(v))
    ret.remove_contents = null if data.get("removeContents") == null else data.get("removeContents").map(func(v): return Gs2NewsContent.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["contents"] = null if contents == null else contents.map(func(v): return null if v == null else v.to_dict())
    ret["removeContents"] = null if remove_contents == null else remove_contents.map(func(v): return null if v == null else v.to_dict())
    return ret