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
class_name Gs2IdleEzStatus
extends RefCounted


var category_name = null
var random_seed = 0
var idle_minutes = 0
var maximum_idle_minutes = 0


func with_category_name(v) -> Gs2IdleEzStatus:
    category_name = v
    return self


func with_random_seed(v) -> Gs2IdleEzStatus:
    random_seed = v
    return self


func with_idle_minutes(v) -> Gs2IdleEzStatus:
    idle_minutes = v
    return self


func with_maximum_idle_minutes(v) -> Gs2IdleEzStatus:
    maximum_idle_minutes = v
    return self


func to_model() -> Gs2IdleStatus:
    var ret = Gs2IdleStatus.new()
    ret.category_name = category_name
    ret.random_seed = random_seed
    ret.idle_minutes = idle_minutes
    ret.maximum_idle_minutes = maximum_idle_minutes
    return ret


static func from_model(model) -> Gs2IdleEzStatus:
    var ret = Gs2IdleEzStatus.new()
    ret.category_name = model.category_name
    ret.random_seed = 0 if model.random_seed == null else model.random_seed
    ret.idle_minutes = 0 if model.idle_minutes == null else model.idle_minutes
    ret.maximum_idle_minutes = 0 if model.maximum_idle_minutes == null else model.maximum_idle_minutes
    return ret