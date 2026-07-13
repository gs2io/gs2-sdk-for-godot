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
class_name Gs2EzConsumeAction
extends RefCounted


var action: Variant = null
var request: Variant = null


func to_model() -> Gs2ConsumeAction:
    var ret = Gs2ConsumeAction.new()
    ret.action = action
    ret.request = request
    return ret


static func from_model(model) -> Gs2EzConsumeAction:
    var ret = Gs2EzConsumeAction.new()
    ret.action = model.action
    ret.request = model.request
    return ret
