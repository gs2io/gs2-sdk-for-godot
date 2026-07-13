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
class_name Gs2MissionEzDecreaseCounterResult
extends RefCounted


var item = null
var changed_completes = []


static func from_model(model) -> Gs2MissionEzDecreaseCounterResult:
    var ret = Gs2MissionEzDecreaseCounterResult.new()
    ret.item = null if model.item == null else Gs2MissionEzCounter.from_model(model.item)
    ret.changed_completes = [] if model.changed_completes == null else model.changed_completes.map(func(v): return Gs2MissionEzComplete.from_model(v))
    return ret