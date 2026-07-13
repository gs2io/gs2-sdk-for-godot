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
class_name Gs2VersionAcceptVersion
extends RefCounted


var accept_version_id = null
var version_name = null
var user_id = null
var version = null
var status = null
var created_at = null
var updated_at = null
var revision = null


func with_accept_version_id(v) -> Gs2VersionAcceptVersion:
    accept_version_id = v
    return self


func with_version_name(v) -> Gs2VersionAcceptVersion:
    version_name = v
    return self


func with_user_id(v) -> Gs2VersionAcceptVersion:
    user_id = v
    return self


func with_version(v) -> Gs2VersionAcceptVersion:
    version = v
    return self


func with_status(v) -> Gs2VersionAcceptVersion:
    status = v
    return self


func with_created_at(v) -> Gs2VersionAcceptVersion:
    created_at = v
    return self


func with_updated_at(v) -> Gs2VersionAcceptVersion:
    updated_at = v
    return self


func with_revision(v) -> Gs2VersionAcceptVersion:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):version:(?<namespaceName>.+):user:(?<userId>.+):version:(?<versionName>.+):accept")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):version:(?<namespaceName>.+):user:(?<userId>.+):version:(?<versionName>.+):accept")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):version:(?<namespaceName>.+):user:(?<userId>.+):version:(?<versionName>.+):accept")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):version:(?<namespaceName>.+):user:(?<userId>.+):version:(?<versionName>.+):accept")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_version_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):version:(?<namespaceName>.+):user:(?<userId>.+):version:(?<versionName>.+):accept")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("versionName")


static func from_dict(data) -> Gs2VersionAcceptVersion:
    if data == null:
        return null
    var ret = Gs2VersionAcceptVersion.new()
    ret.accept_version_id = null if data.get("acceptVersionId") == null else str(data.get("acceptVersionId"))
    ret.version_name = null if data.get("versionName") == null else str(data.get("versionName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.version = null if data.get("version") == null else Gs2VersionVersion.from_dict(data.get("version"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["acceptVersionId"] = accept_version_id
    ret["versionName"] = version_name
    ret["userId"] = user_id
    ret["version"] = null if version == null else version.to_dict()
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret