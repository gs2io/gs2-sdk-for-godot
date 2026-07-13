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
class_name Gs2LotteryGitHubCheckoutSetting
extends RefCounted


var api_key_id = null
var repository_name = null
var source_path = null
var reference_type = null
var commit_hash = null
var branch_name = null
var tag_name = null


func with_api_key_id(v) -> Gs2LotteryGitHubCheckoutSetting:
    api_key_id = v
    return self


func with_repository_name(v) -> Gs2LotteryGitHubCheckoutSetting:
    repository_name = v
    return self


func with_source_path(v) -> Gs2LotteryGitHubCheckoutSetting:
    source_path = v
    return self


func with_reference_type(v) -> Gs2LotteryGitHubCheckoutSetting:
    reference_type = v
    return self


func with_commit_hash(v) -> Gs2LotteryGitHubCheckoutSetting:
    commit_hash = v
    return self


func with_branch_name(v) -> Gs2LotteryGitHubCheckoutSetting:
    branch_name = v
    return self


func with_tag_name(v) -> Gs2LotteryGitHubCheckoutSetting:
    tag_name = v
    return self


static func from_dict(data) -> Gs2LotteryGitHubCheckoutSetting:
    if data == null:
        return null
    var ret = Gs2LotteryGitHubCheckoutSetting.new()
    ret.api_key_id = null if data.get("apiKeyId") == null else str(data.get("apiKeyId"))
    ret.repository_name = null if data.get("repositoryName") == null else str(data.get("repositoryName"))
    ret.source_path = null if data.get("sourcePath") == null else str(data.get("sourcePath"))
    ret.reference_type = null if data.get("referenceType") == null else str(data.get("referenceType"))
    ret.commit_hash = null if data.get("commitHash") == null else str(data.get("commitHash"))
    ret.branch_name = null if data.get("branchName") == null else str(data.get("branchName"))
    ret.tag_name = null if data.get("tagName") == null else str(data.get("tagName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["apiKeyId"] = api_key_id
    ret["repositoryName"] = repository_name
    ret["sourcePath"] = source_path
    ret["referenceType"] = reference_type
    ret["commitHash"] = commit_hash
    ret["branchName"] = branch_name
    ret["tagName"] = tag_name
    return ret