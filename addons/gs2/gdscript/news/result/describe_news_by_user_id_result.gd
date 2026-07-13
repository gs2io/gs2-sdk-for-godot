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
class_name Gs2NewsDescribeNewsByUserIdResult
extends RefCounted


var items = null
var content_hash = null
var template_hash = null
var metadata = null


func with_items(v) -> Gs2NewsDescribeNewsByUserIdResult:
    items = v
    return self


func with_content_hash(v) -> Gs2NewsDescribeNewsByUserIdResult:
    content_hash = v
    return self


func with_template_hash(v) -> Gs2NewsDescribeNewsByUserIdResult:
    template_hash = v
    return self


func with_metadata(v) -> Gs2NewsDescribeNewsByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2NewsDescribeNewsByUserIdResult:
    if data == null:
        return null
    var ret = Gs2NewsDescribeNewsByUserIdResult.new()
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return Gs2NewsNews.from_dict(v))
    ret.content_hash = null if data.get("contentHash") == null else str(data.get("contentHash"))
    ret.template_hash = null if data.get("templateHash") == null else str(data.get("templateHash"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["items"] = null if items == null else items.map(func(v): return null if v == null else v.to_dict())
    ret["contentHash"] = content_hash
    ret["templateHash"] = template_hash
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret