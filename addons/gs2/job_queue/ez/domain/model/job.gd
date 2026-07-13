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
class_name Gs2JobQueueEzJobDomain
extends RefCounted


var _domain: Gs2JobQueueJobDomain
var _connection: Gs2Connection
var auto_run: Variant:
    get:
        return _domain.auto_run
var is_last_job: Variant:
    get:
        return _domain.is_last_job
var need_retry: Variant:
    get:
        return _domain.need_retry
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var job_name: Variant:
    get:
        return null if _domain == null else _domain.job_name


func _init(
    domain: Gs2JobQueueJobDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func job_result(
    try_number
) -> Gs2JobQueueEzJobResultDomain:
    return Gs2JobQueueEzJobResultDomain.new(
        _domain.job_result(
            try_number
        ),
        _connection
    )