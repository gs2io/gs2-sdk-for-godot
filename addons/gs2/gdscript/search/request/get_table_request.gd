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
class_name Gs2SearchGetTableRequest
extends Gs2Request


var namespace_name = null
var table_name = null


func with_namespace_name(v) -> Gs2SearchGetTableRequest:
    namespace_name = v
    return self


func with_table_name(v) -> Gs2SearchGetTableRequest:
    table_name = v
    return self


static func from_dict(data) -> Gs2SearchGetTableRequest:
    if data == null:
        return null
    var ret = Gs2SearchGetTableRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.table_name = null if data.get("tableName") == null else str(data.get("tableName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["tableName"] = table_name
    return ret