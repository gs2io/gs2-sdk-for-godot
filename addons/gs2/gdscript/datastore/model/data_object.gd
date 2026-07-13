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
class_name Gs2DatastoreDataObject
extends RefCounted


var data_object_id = null
var name = null
var user_id = null
var scope = null
var allow_user_ids = null
var status = null
var generation = null
var previous_generation = null
var created_at = null
var updated_at = null
var revision = null


func with_data_object_id(v) -> Gs2DatastoreDataObject:
    data_object_id = v
    return self


func with_name(v) -> Gs2DatastoreDataObject:
    name = v
    return self


func with_user_id(v) -> Gs2DatastoreDataObject:
    user_id = v
    return self


func with_scope(v) -> Gs2DatastoreDataObject:
    scope = v
    return self


func with_allow_user_ids(v) -> Gs2DatastoreDataObject:
    allow_user_ids = v
    return self


func with_status(v) -> Gs2DatastoreDataObject:
    status = v
    return self


func with_generation(v) -> Gs2DatastoreDataObject:
    generation = v
    return self


func with_previous_generation(v) -> Gs2DatastoreDataObject:
    previous_generation = v
    return self


func with_created_at(v) -> Gs2DatastoreDataObject:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DatastoreDataObject:
    updated_at = v
    return self


func with_revision(v) -> Gs2DatastoreDataObject:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_data_object_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("dataObjectName")


static func from_dict(data) -> Gs2DatastoreDataObject:
    if data == null:
        return null
    var ret = Gs2DatastoreDataObject.new()
    ret.data_object_id = null if data.get("dataObjectId") == null else str(data.get("dataObjectId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.scope = null if data.get("scope") == null else str(data.get("scope"))
    ret.allow_user_ids = null if data.get("allowUserIds") == null else data.get("allowUserIds").map(func(v): return str(v))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    ret.previous_generation = null if data.get("previousGeneration") == null else str(data.get("previousGeneration"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dataObjectId"] = data_object_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["scope"] = scope
    ret["allowUserIds"] = allow_user_ids
    ret["status"] = status
    ret["generation"] = generation
    ret["previousGeneration"] = previous_generation
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret