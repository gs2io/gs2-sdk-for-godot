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
class_name Gs2SearchUpdateIndexRequest
extends Gs2Request


var namespace_name = null
var table_name = null
var index_name = null
var description = null
var column_names = null


func with_namespace_name(v) -> Gs2SearchUpdateIndexRequest:
    namespace_name = v
    return self


func with_table_name(v) -> Gs2SearchUpdateIndexRequest:
    table_name = v
    return self


func with_index_name(v) -> Gs2SearchUpdateIndexRequest:
    index_name = v
    return self


func with_description(v) -> Gs2SearchUpdateIndexRequest:
    description = v
    return self


func with_column_names(v) -> Gs2SearchUpdateIndexRequest:
    column_names = v
    return self


static func from_dict(data) -> Gs2SearchUpdateIndexRequest:
    if data == null:
        return null
    var ret = Gs2SearchUpdateIndexRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.table_name = null if data.get("tableName") == null else str(data.get("tableName"))
    ret.index_name = null if data.get("indexName") == null else str(data.get("indexName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.column_names = null if data.get("columnNames") == null else data.get("columnNames").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["tableName"] = table_name
    ret["indexName"] = index_name
    ret["description"] = description
    ret["columnNames"] = column_names
    return ret