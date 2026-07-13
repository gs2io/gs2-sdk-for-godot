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
class_name Gs2NewsWantGrantResult
extends RefCounted


var items = null
var browser_url = null
var zip_url = null
var metadata = null


func with_items(v) -> Gs2NewsWantGrantResult:
    items = v
    return self


func with_browser_url(v) -> Gs2NewsWantGrantResult:
    browser_url = v
    return self


func with_zip_url(v) -> Gs2NewsWantGrantResult:
    zip_url = v
    return self


func with_metadata(v) -> Gs2NewsWantGrantResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2NewsWantGrantResult:
    if data == null:
        return null
    var ret = Gs2NewsWantGrantResult.new()
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return Gs2NewsSetCookieRequestEntry.from_dict(v))
    ret.browser_url = null if data.get("browserUrl") == null else str(data.get("browserUrl"))
    ret.zip_url = null if data.get("zipUrl") == null else str(data.get("zipUrl"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["items"] = null if items == null else items.map(func(v): return null if v == null else v.to_dict())
    ret["browserUrl"] = browser_url
    ret["zipUrl"] = zip_url
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret