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
class_name Gs2DistributorEzSetDefaultConfigResult
extends RefCounted


var new_context_stack = null


static func from_model(model) -> Gs2DistributorEzSetDefaultConfigResult:
    var ret = Gs2DistributorEzSetDefaultConfigResult.new()
    ret.new_context_stack = model.new_context_stack
    return ret