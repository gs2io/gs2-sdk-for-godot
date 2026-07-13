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
class_name Gs2FreezePromoteStageRequest
extends Gs2Request


var stage_name = null


func with_stage_name(v) -> Gs2FreezePromoteStageRequest:
    stage_name = v
    return self


static func from_dict(data) -> Gs2FreezePromoteStageRequest:
    if data == null:
        return null
    var ret = Gs2FreezePromoteStageRequest.new()
    ret.stage_name = null if data.get("stageName") == null else str(data.get("stageName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stageName"] = stage_name
    return ret