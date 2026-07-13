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
class_name Gs2AdRewardLogSetting
extends RefCounted


var logging_namespace_id = null


func with_logging_namespace_id(v) -> Gs2AdRewardLogSetting:
    logging_namespace_id = v
    return self


static func from_dict(data) -> Gs2AdRewardLogSetting:
    if data == null:
        return null
    var ret = Gs2AdRewardLogSetting.new()
    ret.logging_namespace_id = null if data.get("loggingNamespaceId") == null else str(data.get("loggingNamespaceId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["loggingNamespaceId"] = logging_namespace_id
    return ret