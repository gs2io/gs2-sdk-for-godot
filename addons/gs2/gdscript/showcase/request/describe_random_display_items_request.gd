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
class_name Gs2ShowcaseDescribeRandomDisplayItemsRequest
extends Gs2Request


var namespace_name = null
var showcase_name = null
var access_token = null


func with_namespace_name(v) -> Gs2ShowcaseDescribeRandomDisplayItemsRequest:
    namespace_name = v
    return self


func with_showcase_name(v) -> Gs2ShowcaseDescribeRandomDisplayItemsRequest:
    showcase_name = v
    return self


func with_access_token(v) -> Gs2ShowcaseDescribeRandomDisplayItemsRequest:
    access_token = v
    return self


static func from_dict(data) -> Gs2ShowcaseDescribeRandomDisplayItemsRequest:
    if data == null:
        return null
    var ret = Gs2ShowcaseDescribeRandomDisplayItemsRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.showcase_name = null if data.get("showcaseName") == null else str(data.get("showcaseName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["showcaseName"] = showcase_name
    ret["accessToken"] = access_token
    return ret