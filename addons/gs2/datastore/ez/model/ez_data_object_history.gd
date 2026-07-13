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
class_name Gs2DatastoreEzDataObjectHistory
extends RefCounted


var data_object_history_id = null
var generation = null
var content_length = 0
var created_at = 0


func with_data_object_history_id(v) -> Gs2DatastoreEzDataObjectHistory:
    data_object_history_id = v
    return self


func with_generation(v) -> Gs2DatastoreEzDataObjectHistory:
    generation = v
    return self


func with_content_length(v) -> Gs2DatastoreEzDataObjectHistory:
    content_length = v
    return self


func with_created_at(v) -> Gs2DatastoreEzDataObjectHistory:
    created_at = v
    return self


func to_model() -> Gs2DatastoreDataObjectHistory:
    var ret = Gs2DatastoreDataObjectHistory.new()
    ret.data_object_history_id = data_object_history_id
    ret.generation = generation
    ret.content_length = content_length
    ret.created_at = created_at
    return ret


static func from_model(model) -> Gs2DatastoreEzDataObjectHistory:
    var ret = Gs2DatastoreEzDataObjectHistory.new()
    ret.data_object_history_id = model.data_object_history_id
    ret.generation = model.generation
    ret.content_length = 0 if model.content_length == null else model.content_length
    ret.created_at = 0 if model.created_at == null else model.created_at
    return ret