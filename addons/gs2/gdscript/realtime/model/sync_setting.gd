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
class_name Gs2RealtimeSyncSetting
extends RefCounted


var object_catalog = null


func with_object_catalog(v) -> Gs2RealtimeSyncSetting:
    object_catalog = v
    return self


static func from_dict(data) -> Gs2RealtimeSyncSetting:
    if data == null:
        return null
    var ret = Gs2RealtimeSyncSetting.new()
    ret.object_catalog = null if data.get("objectCatalog") == null else str(data.get("objectCatalog"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["objectCatalog"] = object_catalog
    return ret