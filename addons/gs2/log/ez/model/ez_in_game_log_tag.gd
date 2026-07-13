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
class_name Gs2LogEzInGameLogTag
extends RefCounted


var key = null
var value = null


func with_key(v) -> Gs2LogEzInGameLogTag:
    key = v
    return self


func with_value(v) -> Gs2LogEzInGameLogTag:
    value = v
    return self


func to_model() -> Gs2LogInGameLogTag:
    var ret = Gs2LogInGameLogTag.new()
    ret.key = key
    ret.value = value
    return ret


static func from_model(model) -> Gs2LogEzInGameLogTag:
    var ret = Gs2LogEzInGameLogTag.new()
    ret.key = model.key
    ret.value = model.value
    return ret