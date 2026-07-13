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
class_name Gs2DistributorEzDistributorModel
extends RefCounted


var name = null
var metadata = null
var inbox_namespace_id = null
var white_list_target_ids = []


func with_name(v) -> Gs2DistributorEzDistributorModel:
    name = v
    return self


func with_metadata(v) -> Gs2DistributorEzDistributorModel:
    metadata = v
    return self


func with_inbox_namespace_id(v) -> Gs2DistributorEzDistributorModel:
    inbox_namespace_id = v
    return self


func with_white_list_target_ids(v) -> Gs2DistributorEzDistributorModel:
    white_list_target_ids = v
    return self


func to_model() -> Gs2DistributorDistributorModel:
    var ret = Gs2DistributorDistributorModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.inbox_namespace_id = inbox_namespace_id
    ret.white_list_target_ids = null if white_list_target_ids == null else white_list_target_ids.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2DistributorEzDistributorModel:
    var ret = Gs2DistributorEzDistributorModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.inbox_namespace_id = model.inbox_namespace_id
    ret.white_list_target_ids = [] if model.white_list_target_ids == null else model.white_list_target_ids.map(func(v): return v)
    return ret