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
class_name Gs2NewsCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var log_setting = null


func with_name(v) -> Gs2NewsCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2NewsCreateNamespaceRequest:
    description = v
    return self


func with_log_setting(v) -> Gs2NewsCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2NewsCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2NewsCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2NewsLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret