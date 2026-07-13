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
class_name Gs2EnhanceEzProgress
extends RefCounted


var name = null
var rate_name = null
var property_id = null
var experience_value = 0
var rate = 0


func with_name(v) -> Gs2EnhanceEzProgress:
    name = v
    return self


func with_rate_name(v) -> Gs2EnhanceEzProgress:
    rate_name = v
    return self


func with_property_id(v) -> Gs2EnhanceEzProgress:
    property_id = v
    return self


func with_experience_value(v) -> Gs2EnhanceEzProgress:
    experience_value = v
    return self


func with_rate(v) -> Gs2EnhanceEzProgress:
    rate = v
    return self


func to_model() -> Gs2EnhanceProgress:
    var ret = Gs2EnhanceProgress.new()
    ret.name = name
    ret.rate_name = rate_name
    ret.property_id = property_id
    ret.experience_value = experience_value
    ret.rate = rate
    return ret


static func from_model(model) -> Gs2EnhanceEzProgress:
    var ret = Gs2EnhanceEzProgress.new()
    ret.name = model.name
    ret.rate_name = model.rate_name
    ret.property_id = model.property_id
    ret.experience_value = 0 if model.experience_value == null else model.experience_value
    ret.rate = 0 if model.rate == null else model.rate
    return ret