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
class_name Gs2DistributorEzRunVerifyTaskWithoutNamespaceResult
extends RefCounted


var context_stack = null
var status_code = 0
var result = null


static func from_model(model) -> Gs2DistributorEzRunVerifyTaskWithoutNamespaceResult:
    var ret = Gs2DistributorEzRunVerifyTaskWithoutNamespaceResult.new()
    ret.context_stack = model.context_stack
    ret.status_code = 0 if model.status_code == null else model.status_code
    ret.result = model.result
    return ret