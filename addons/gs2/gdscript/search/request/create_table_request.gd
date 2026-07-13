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
class_name Gs2SearchCreateTableRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var primary_key_name = null
var columns = null


func with_namespace_name(v) -> Gs2SearchCreateTableRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2SearchCreateTableRequest:
    name = v
    return self


func with_description(v) -> Gs2SearchCreateTableRequest:
    description = v
    return self


func with_primary_key_name(v) -> Gs2SearchCreateTableRequest:
    primary_key_name = v
    return self


func with_columns(v) -> Gs2SearchCreateTableRequest:
    columns = v
    return self


static func from_dict(data) -> Gs2SearchCreateTableRequest:
    if data == null:
        return null
    var ret = Gs2SearchCreateTableRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.primary_key_name = null if data.get("primaryKeyName") == null else str(data.get("primaryKeyName"))
    ret.columns = null if data.get("columns") == null else data.get("columns").map(func(v): return Gs2SearchColumn.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["primaryKeyName"] = primary_key_name
    ret["columns"] = null if columns == null else columns.map(func(v): return null if v == null else v.to_dict())
    return ret