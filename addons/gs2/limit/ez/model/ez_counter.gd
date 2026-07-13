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
class_name Gs2LimitEzCounter
extends RefCounted


var counter_id = null
var limit_name = null
var name = null
var count = 0
var created_at = 0
var updated_at = 0


func with_counter_id(v) -> Gs2LimitEzCounter:
    counter_id = v
    return self


func with_limit_name(v) -> Gs2LimitEzCounter:
    limit_name = v
    return self


func with_name(v) -> Gs2LimitEzCounter:
    name = v
    return self


func with_count(v) -> Gs2LimitEzCounter:
    count = v
    return self


func with_created_at(v) -> Gs2LimitEzCounter:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LimitEzCounter:
    updated_at = v
    return self


func to_model() -> Gs2LimitCounter:
    var ret = Gs2LimitCounter.new()
    ret.counter_id = counter_id
    ret.limit_name = limit_name
    ret.name = name
    ret.count = count
    ret.created_at = created_at
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2LimitEzCounter:
    var ret = Gs2LimitEzCounter.new()
    ret.counter_id = model.counter_id
    ret.limit_name = model.limit_name
    ret.name = model.name
    ret.count = 0 if model.count == null else model.count
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret