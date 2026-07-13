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
class_name Gs2AdRewardEzPoint
extends RefCounted


var point = 0


func with_point(v) -> Gs2AdRewardEzPoint:
    point = v
    return self


func to_model() -> Gs2AdRewardPoint:
    var ret = Gs2AdRewardPoint.new()
    ret.point = point
    return ret


static func from_model(model) -> Gs2AdRewardEzPoint:
    var ret = Gs2AdRewardEzPoint.new()
    ret.point = 0 if model.point == null else model.point
    return ret