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
class_name Gs2ExperienceDescribeStatusesRequest
extends Gs2Request


var namespace_name = null
var experience_name = null
var access_token = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2ExperienceDescribeStatusesRequest:
    namespace_name = v
    return self


func with_experience_name(v) -> Gs2ExperienceDescribeStatusesRequest:
    experience_name = v
    return self


func with_access_token(v) -> Gs2ExperienceDescribeStatusesRequest:
    access_token = v
    return self


func with_page_token(v) -> Gs2ExperienceDescribeStatusesRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2ExperienceDescribeStatusesRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2ExperienceDescribeStatusesRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceDescribeStatusesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["experienceName"] = experience_name
    ret["accessToken"] = access_token
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret