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
class_name Gs2SerialKeyIssueJob
extends RefCounted


var issue_job_id = null
var name = null
var metadata = null
var issued_count = null
var issue_request_count = null
var status = null
var created_at = null
var revision = null


func with_issue_job_id(v) -> Gs2SerialKeyIssueJob:
    issue_job_id = v
    return self


func with_name(v) -> Gs2SerialKeyIssueJob:
    name = v
    return self


func with_metadata(v) -> Gs2SerialKeyIssueJob:
    metadata = v
    return self


func with_issued_count(v) -> Gs2SerialKeyIssueJob:
    issued_count = v
    return self


func with_issue_request_count(v) -> Gs2SerialKeyIssueJob:
    issue_request_count = v
    return self


func with_status(v) -> Gs2SerialKeyIssueJob:
    status = v
    return self


func with_created_at(v) -> Gs2SerialKeyIssueJob:
    created_at = v
    return self


func with_revision(v) -> Gs2SerialKeyIssueJob:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):model:campaign:(?<campaignModelName>.+):issue:job:(?<issueJobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):model:campaign:(?<campaignModelName>.+):issue:job:(?<issueJobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):model:campaign:(?<campaignModelName>.+):issue:job:(?<issueJobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_campaign_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):model:campaign:(?<campaignModelName>.+):issue:job:(?<issueJobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("campaignModelName")


static func get_issue_job_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):model:campaign:(?<campaignModelName>.+):issue:job:(?<issueJobName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("issueJobName")


static func from_dict(data) -> Gs2SerialKeyIssueJob:
    if data == null:
        return null
    var ret = Gs2SerialKeyIssueJob.new()
    ret.issue_job_id = null if data.get("issueJobId") == null else str(data.get("issueJobId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.issued_count = null if data.get("issuedCount") == null else int(data.get("issuedCount"))
    ret.issue_request_count = null if data.get("issueRequestCount") == null else int(data.get("issueRequestCount"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["issueJobId"] = issue_job_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["issuedCount"] = issued_count
    ret["issueRequestCount"] = issue_request_count
    ret["status"] = status
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret