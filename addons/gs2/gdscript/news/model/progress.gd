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
class_name Gs2NewsProgress
extends RefCounted


var progress_id = null
var upload_token = null
var generated = null
var pattern_count = null
var created_at = null
var updated_at = null
var revision = null


func with_progress_id(v) -> Gs2NewsProgress:
    progress_id = v
    return self


func with_upload_token(v) -> Gs2NewsProgress:
    upload_token = v
    return self


func with_generated(v) -> Gs2NewsProgress:
    generated = v
    return self


func with_pattern_count(v) -> Gs2NewsProgress:
    pattern_count = v
    return self


func with_created_at(v) -> Gs2NewsProgress:
    created_at = v
    return self


func with_updated_at(v) -> Gs2NewsProgress:
    updated_at = v
    return self


func with_revision(v) -> Gs2NewsProgress:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):news:(?<namespaceName>.+):progress:(?<uploadToken>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):news:(?<namespaceName>.+):progress:(?<uploadToken>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):news:(?<namespaceName>.+):progress:(?<uploadToken>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_upload_token_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):news:(?<namespaceName>.+):progress:(?<uploadToken>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("uploadToken")


static func from_dict(data) -> Gs2NewsProgress:
    if data == null:
        return null
    var ret = Gs2NewsProgress.new()
    ret.progress_id = null if data.get("progressId") == null else str(data.get("progressId"))
    ret.upload_token = null if data.get("uploadToken") == null else str(data.get("uploadToken"))
    ret.generated = null if data.get("generated") == null else int(data.get("generated"))
    ret.pattern_count = null if data.get("patternCount") == null else int(data.get("patternCount"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["progressId"] = progress_id
    ret["uploadToken"] = upload_token
    ret["generated"] = generated
    ret["patternCount"] = pattern_count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret