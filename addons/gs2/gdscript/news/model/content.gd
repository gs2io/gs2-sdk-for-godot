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
class_name Gs2NewsContent
extends RefCounted


var section = null
var content = null
var front_matter = null


func with_section(v) -> Gs2NewsContent:
    section = v
    return self


func with_content(v) -> Gs2NewsContent:
    content = v
    return self


func with_front_matter(v) -> Gs2NewsContent:
    front_matter = v
    return self


static func from_dict(data) -> Gs2NewsContent:
    if data == null:
        return null
    var ret = Gs2NewsContent.new()
    ret.section = null if data.get("section") == null else str(data.get("section"))
    ret.content = null if data.get("content") == null else str(data.get("content"))
    ret.front_matter = null if data.get("frontMatter") == null else str(data.get("frontMatter"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["section"] = section
    ret["content"] = content
    ret["frontMatter"] = front_matter
    return ret