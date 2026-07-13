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
class_name Gs2IdentifierDescribeSecurityPoliciesRequest
extends Gs2Request


var page_token = null
var limit = null


func with_page_token(v) -> Gs2IdentifierDescribeSecurityPoliciesRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2IdentifierDescribeSecurityPoliciesRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2IdentifierDescribeSecurityPoliciesRequest:
    if data == null:
        return null
    var ret = Gs2IdentifierDescribeSecurityPoliciesRequest.new()
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret