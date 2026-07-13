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
class_name Gs2MegaFieldEzScope
extends RefCounted


var r = 0
var limit = 0


func with_r(v) -> Gs2MegaFieldEzScope:
    r = v
    return self


func with_limit(v) -> Gs2MegaFieldEzScope:
    limit = v
    return self


func to_model() -> Gs2MegaFieldScope:
    var ret = Gs2MegaFieldScope.new()
    ret.r = r
    ret.limit = limit
    return ret


static func from_model(model) -> Gs2MegaFieldEzScope:
    var ret = Gs2MegaFieldEzScope.new()
    ret.r = 0 if model.r == null else model.r
    ret.limit = 0 if model.limit == null else model.limit
    return ret