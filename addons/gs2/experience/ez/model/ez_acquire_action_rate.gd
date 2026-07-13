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
class_name Gs2ExperienceEzAcquireActionRate
extends RefCounted


var name = null
var mode = null
var rates = []
var big_rates = []


func with_name(v) -> Gs2ExperienceEzAcquireActionRate:
    name = v
    return self


func with_mode(v) -> Gs2ExperienceEzAcquireActionRate:
    mode = v
    return self


func with_rates(v) -> Gs2ExperienceEzAcquireActionRate:
    rates = v
    return self


func with_big_rates(v) -> Gs2ExperienceEzAcquireActionRate:
    big_rates = v
    return self


func to_model() -> Gs2ExperienceAcquireActionRate:
    var ret = Gs2ExperienceAcquireActionRate.new()
    ret.name = name
    ret.mode = mode
    ret.rates = null if rates == null else rates.map(func(v): return v)
    ret.big_rates = null if big_rates == null else big_rates.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2ExperienceEzAcquireActionRate:
    var ret = Gs2ExperienceEzAcquireActionRate.new()
    ret.name = model.name
    ret.mode = model.mode
    ret.rates = [] if model.rates == null else model.rates.map(func(v): return v)
    ret.big_rates = [] if model.big_rates == null else model.big_rates.map(func(v): return v)
    return ret