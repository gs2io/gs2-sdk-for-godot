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
class_name Gs2DistributorEzDistributeDomain
extends RefCounted


var _domain: Gs2DistributorDistributeDomain
var _connection: Gs2Connection
var inbox_namespace_id: Variant:
    get:
        return _domain.inbox_namespace_id
var result: Variant:
    get:
        return _domain.result
var context_stack: Variant:
    get:
        return _domain.context_stack
var status_code: Variant:
    get:
        return _domain.status_code
var verify_task_result_codes: Variant:
    get:
        return _domain.verify_task_result_codes
var verify_task_results: Variant:
    get:
        return _domain.verify_task_results
var task_result_codes: Variant:
    get:
        return _domain.task_result_codes
var task_results: Variant:
    get:
        return _domain.task_results
var sheet_result_code: Variant:
    get:
        return _domain.sheet_result_code
var sheet_result: Variant:
    get:
        return _domain.sheet_result
var body: Variant:
    get:
        return _domain.body
var signature: Variant:
    get:
        return _domain.signature
var results: Variant:
    get:
        return null if _domain.results == null else _domain.results.map(func(v): return Gs2DistributorEzBatchResultPayload.from_model(v))
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2DistributorDistributeDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection