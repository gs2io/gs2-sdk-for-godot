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
class_name Gs2JobQueueJobResult
extends RefCounted


var job_result_id = null
var job_id = null
var script_id = null
var args = null
var try_number = null
var status_code = null
var result = null
var try_at = null


func with_job_result_id(v) -> Gs2JobQueueJobResult:
    job_result_id = v
    return self


func with_job_id(v) -> Gs2JobQueueJobResult:
    job_id = v
    return self


func with_script_id(v) -> Gs2JobQueueJobResult:
    script_id = v
    return self


func with_args(v) -> Gs2JobQueueJobResult:
    args = v
    return self


func with_try_number(v) -> Gs2JobQueueJobResult:
    try_number = v
    return self


func with_status_code(v) -> Gs2JobQueueJobResult:
    status_code = v
    return self


func with_result(v) -> Gs2JobQueueJobResult:
    result = v
    return self


func with_try_at(v) -> Gs2JobQueueJobResult:
    try_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_job_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("jobName")


static func get_try_number_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+):jobResult:(?<tryNumber>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("tryNumber")


static func from_dict(data) -> Gs2JobQueueJobResult:
    if data == null:
        return null
    var ret = Gs2JobQueueJobResult.new()
    ret.job_result_id = null if data.get("jobResultId") == null else str(data.get("jobResultId"))
    ret.job_id = null if data.get("jobId") == null else str(data.get("jobId"))
    ret.script_id = null if data.get("scriptId") == null else str(data.get("scriptId"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    ret.try_number = null if data.get("tryNumber") == null else int(data.get("tryNumber"))
    ret.status_code = null if data.get("statusCode") == null else int(data.get("statusCode"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.try_at = null if data.get("tryAt") == null else int(data.get("tryAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["jobResultId"] = job_result_id
    ret["jobId"] = job_id
    ret["scriptId"] = script_id
    ret["args"] = args
    ret["tryNumber"] = try_number
    ret["statusCode"] = status_code
    ret["result"] = result
    ret["tryAt"] = try_at
    return ret