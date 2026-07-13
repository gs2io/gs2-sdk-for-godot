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
class_name Gs2JobQueueJob
extends RefCounted


var job_id = null
var name = null
var user_id = null
var script_id = null
var args = null
var current_retry_count = null
var max_try_count = null
var created_at = null
var updated_at = null


func with_job_id(v) -> Gs2JobQueueJob:
    job_id = v
    return self


func with_name(v) -> Gs2JobQueueJob:
    name = v
    return self


func with_user_id(v) -> Gs2JobQueueJob:
    user_id = v
    return self


func with_script_id(v) -> Gs2JobQueueJob:
    script_id = v
    return self


func with_args(v) -> Gs2JobQueueJob:
    args = v
    return self


func with_current_retry_count(v) -> Gs2JobQueueJob:
    current_retry_count = v
    return self


func with_max_try_count(v) -> Gs2JobQueueJob:
    max_try_count = v
    return self


func with_created_at(v) -> Gs2JobQueueJob:
    created_at = v
    return self


func with_updated_at(v) -> Gs2JobQueueJob:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_job_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+):user:(?<userId>.+):job:(?<jobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("jobName")


static func from_dict(data) -> Gs2JobQueueJob:
    if data == null:
        return null
    var ret = Gs2JobQueueJob.new()
    ret.job_id = null if data.get("jobId") == null else str(data.get("jobId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.script_id = null if data.get("scriptId") == null else str(data.get("scriptId"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    ret.current_retry_count = null if data.get("currentRetryCount") == null else int(data.get("currentRetryCount"))
    ret.max_try_count = null if data.get("maxTryCount") == null else int(data.get("maxTryCount"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["jobId"] = job_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["scriptId"] = script_id
    ret["args"] = args
    ret["currentRetryCount"] = current_retry_count
    ret["maxTryCount"] = max_try_count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret