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
class_name Gs2LogQueryInGameLogResult
extends RefCounted


var items = null
var next_page_token = null
var total_count = null
var scan_size = null
var metadata = null


func with_items(v) -> Gs2LogQueryInGameLogResult:
    items = v
    return self


func with_next_page_token(v) -> Gs2LogQueryInGameLogResult:
    next_page_token = v
    return self


func with_total_count(v) -> Gs2LogQueryInGameLogResult:
    total_count = v
    return self


func with_scan_size(v) -> Gs2LogQueryInGameLogResult:
    scan_size = v
    return self


func with_metadata(v) -> Gs2LogQueryInGameLogResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2LogQueryInGameLogResult:
    if data == null:
        return null
    var ret = Gs2LogQueryInGameLogResult.new()
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return Gs2LogInGameLog.from_dict(v))
    ret.next_page_token = null if data.get("nextPageToken") == null else str(data.get("nextPageToken"))
    ret.total_count = null if data.get("totalCount") == null else int(data.get("totalCount"))
    ret.scan_size = null if data.get("scanSize") == null else int(data.get("scanSize"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["items"] = null if items == null else items.map(func(v): return null if v == null else v.to_dict())
    ret["nextPageToken"] = next_page_token
    ret["totalCount"] = total_count
    ret["scanSize"] = scan_size
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret