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
class_name Gs2RealtimeStateMachineSetting
extends RefCounted


var namespace_id = null
var version = null


func with_namespace_id(v) -> Gs2RealtimeStateMachineSetting:
    namespace_id = v
    return self


func with_version(v) -> Gs2RealtimeStateMachineSetting:
    version = v
    return self


static func from_dict(data) -> Gs2RealtimeStateMachineSetting:
    if data == null:
        return null
    var ret = Gs2RealtimeStateMachineSetting.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.version = null if data.get("version") == null else int(data.get("version"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["version"] = version
    return ret