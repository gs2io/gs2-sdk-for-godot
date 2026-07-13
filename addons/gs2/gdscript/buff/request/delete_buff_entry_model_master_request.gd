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
class_name Gs2BuffDeleteBuffEntryModelMasterRequest
extends Gs2Request


var namespace_name = null
var buff_entry_name = null


func with_namespace_name(v) -> Gs2BuffDeleteBuffEntryModelMasterRequest:
    namespace_name = v
    return self


func with_buff_entry_name(v) -> Gs2BuffDeleteBuffEntryModelMasterRequest:
    buff_entry_name = v
    return self


static func from_dict(data) -> Gs2BuffDeleteBuffEntryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2BuffDeleteBuffEntryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.buff_entry_name = null if data.get("buffEntryName") == null else str(data.get("buffEntryName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["buffEntryName"] = buff_entry_name
    return ret