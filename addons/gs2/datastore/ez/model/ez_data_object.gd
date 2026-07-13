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
class_name Gs2DatastoreEzDataObject
extends RefCounted


var data_object_id = null
var name = null
var user_id = null
var scope = null
var allow_user_ids = []
var status = null
var generation = null
var created_at = 0
var updated_at = 0


func with_data_object_id(v) -> Gs2DatastoreEzDataObject:
    data_object_id = v
    return self


func with_name(v) -> Gs2DatastoreEzDataObject:
    name = v
    return self


func with_user_id(v) -> Gs2DatastoreEzDataObject:
    user_id = v
    return self


func with_scope(v) -> Gs2DatastoreEzDataObject:
    scope = v
    return self


func with_allow_user_ids(v) -> Gs2DatastoreEzDataObject:
    allow_user_ids = v
    return self


func with_status(v) -> Gs2DatastoreEzDataObject:
    status = v
    return self


func with_generation(v) -> Gs2DatastoreEzDataObject:
    generation = v
    return self


func with_created_at(v) -> Gs2DatastoreEzDataObject:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DatastoreEzDataObject:
    updated_at = v
    return self


func to_model() -> Gs2DatastoreDataObject:
    var ret = Gs2DatastoreDataObject.new()
    ret.data_object_id = data_object_id
    ret.name = name
    ret.user_id = user_id
    ret.scope = scope
    ret.allow_user_ids = null if allow_user_ids == null else allow_user_ids.map(func(v): return v)
    ret.status = status
    ret.generation = generation
    ret.created_at = created_at
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2DatastoreEzDataObject:
    var ret = Gs2DatastoreEzDataObject.new()
    ret.data_object_id = model.data_object_id
    ret.name = model.name
    ret.user_id = model.user_id
    ret.scope = model.scope
    ret.allow_user_ids = [] if model.allow_user_ids == null else model.allow_user_ids.map(func(v): return v)
    ret.status = model.status
    ret.generation = model.generation
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret