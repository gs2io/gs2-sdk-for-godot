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
class_name Gs2EnchantEzRarityParameterCountModel
extends RefCounted


var count = 0
var weight = 0


func with_count(v) -> Gs2EnchantEzRarityParameterCountModel:
    count = v
    return self


func with_weight(v) -> Gs2EnchantEzRarityParameterCountModel:
    weight = v
    return self


func to_model() -> Gs2EnchantRarityParameterCountModel:
    var ret = Gs2EnchantRarityParameterCountModel.new()
    ret.count = count
    ret.weight = weight
    return ret


static func from_model(model) -> Gs2EnchantEzRarityParameterCountModel:
    var ret = Gs2EnchantEzRarityParameterCountModel.new()
    ret.count = 0 if model.count == null else model.count
    ret.weight = 0 if model.weight == null else model.weight
    return ret