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
class_name Gs2SeasonRatingMatchSession
extends RefCounted


var session_id = null
var name = null
var created_at = null
var revision = null


func with_session_id(v) -> Gs2SeasonRatingMatchSession:
    session_id = v
    return self


func with_name(v) -> Gs2SeasonRatingMatchSession:
    name = v
    return self


func with_created_at(v) -> Gs2SeasonRatingMatchSession:
    created_at = v
    return self


func with_revision(v) -> Gs2SeasonRatingMatchSession:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):session:(?<sessionName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):session:(?<sessionName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):session:(?<sessionName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_session_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):session:(?<sessionName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("sessionName")


static func from_dict(data) -> Gs2SeasonRatingMatchSession:
    if data == null:
        return null
    var ret = Gs2SeasonRatingMatchSession.new()
    ret.session_id = null if data.get("sessionId") == null else str(data.get("sessionId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["sessionId"] = session_id
    ret["name"] = name
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret