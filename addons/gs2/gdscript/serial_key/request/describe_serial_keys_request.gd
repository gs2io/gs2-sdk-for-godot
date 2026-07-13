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
class_name Gs2SerialKeyDescribeSerialKeysRequest
extends Gs2Request


var namespace_name = null
var campaign_model_name = null
var issue_job_name = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2SerialKeyDescribeSerialKeysRequest:
    namespace_name = v
    return self


func with_campaign_model_name(v) -> Gs2SerialKeyDescribeSerialKeysRequest:
    campaign_model_name = v
    return self


func with_issue_job_name(v) -> Gs2SerialKeyDescribeSerialKeysRequest:
    issue_job_name = v
    return self


func with_page_token(v) -> Gs2SerialKeyDescribeSerialKeysRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2SerialKeyDescribeSerialKeysRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2SerialKeyDescribeSerialKeysRequest:
    if data == null:
        return null
    var ret = Gs2SerialKeyDescribeSerialKeysRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.campaign_model_name = null if data.get("campaignModelName") == null else str(data.get("campaignModelName"))
    ret.issue_job_name = null if data.get("issueJobName") == null else str(data.get("issueJobName"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["campaignModelName"] = campaign_model_name
    ret["issueJobName"] = issue_job_name
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret