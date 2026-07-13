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
class_name Gs2ExperienceEzStatus
extends RefCounted


var experience_name = null
var property_id = null
var experience_value = 0
var rank_value = 0
var rank_cap_value = 0
var next_rank_up_experience_value = 0


func with_experience_name(v) -> Gs2ExperienceEzStatus:
    experience_name = v
    return self


func with_property_id(v) -> Gs2ExperienceEzStatus:
    property_id = v
    return self


func with_experience_value(v) -> Gs2ExperienceEzStatus:
    experience_value = v
    return self


func with_rank_value(v) -> Gs2ExperienceEzStatus:
    rank_value = v
    return self


func with_rank_cap_value(v) -> Gs2ExperienceEzStatus:
    rank_cap_value = v
    return self


func with_next_rank_up_experience_value(v) -> Gs2ExperienceEzStatus:
    next_rank_up_experience_value = v
    return self


func to_model() -> Gs2ExperienceStatus:
    var ret = Gs2ExperienceStatus.new()
    ret.experience_name = experience_name
    ret.property_id = property_id
    ret.experience_value = experience_value
    ret.rank_value = rank_value
    ret.rank_cap_value = rank_cap_value
    ret.next_rank_up_experience_value = next_rank_up_experience_value
    return ret


static func from_model(model) -> Gs2ExperienceEzStatus:
    var ret = Gs2ExperienceEzStatus.new()
    ret.experience_name = model.experience_name
    ret.property_id = model.property_id
    ret.experience_value = 0 if model.experience_value == null else model.experience_value
    ret.rank_value = 0 if model.rank_value == null else model.rank_value
    ret.rank_cap_value = 0 if model.rank_cap_value == null else model.rank_cap_value
    ret.next_rank_up_experience_value = 0 if model.next_rank_up_experience_value == null else model.next_rank_up_experience_value
    return ret