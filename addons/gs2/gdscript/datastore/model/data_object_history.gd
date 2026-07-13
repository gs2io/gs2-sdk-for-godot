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
class_name Gs2DatastoreDataObjectHistory
extends RefCounted


var data_object_history_id = null
var data_object_name = null
var generation = null
var content_length = null
var created_at = null
var revision = null


func with_data_object_history_id(v) -> Gs2DatastoreDataObjectHistory:
    data_object_history_id = v
    return self


func with_data_object_name(v) -> Gs2DatastoreDataObjectHistory:
    data_object_name = v
    return self


func with_generation(v) -> Gs2DatastoreDataObjectHistory:
    generation = v
    return self


func with_content_length(v) -> Gs2DatastoreDataObjectHistory:
    content_length = v
    return self


func with_created_at(v) -> Gs2DatastoreDataObjectHistory:
    created_at = v
    return self


func with_revision(v) -> Gs2DatastoreDataObjectHistory:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_data_object_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("dataObjectName")


static func get_generation_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+):user:(?<userId>.+):data:(?<dataObjectName>.+):history:(?<generation>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("generation")


static func from_dict(data) -> Gs2DatastoreDataObjectHistory:
    if data == null:
        return null
    var ret = Gs2DatastoreDataObjectHistory.new()
    ret.data_object_history_id = null if data.get("dataObjectHistoryId") == null else str(data.get("dataObjectHistoryId"))
    ret.data_object_name = null if data.get("dataObjectName") == null else str(data.get("dataObjectName"))
    ret.generation = null if data.get("generation") == null else str(data.get("generation"))
    ret.content_length = null if data.get("contentLength") == null else int(data.get("contentLength"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dataObjectHistoryId"] = data_object_history_id
    ret["dataObjectName"] = data_object_name
    ret["generation"] = generation
    ret["contentLength"] = content_length
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret