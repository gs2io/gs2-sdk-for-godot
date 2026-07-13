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
class_name Gs2ChatDescribeLatestMessagesRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var password = null
var category = null
var access_token = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2ChatDescribeLatestMessagesRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatDescribeLatestMessagesRequest:
    room_name = v
    return self


func with_password(v) -> Gs2ChatDescribeLatestMessagesRequest:
    password = v
    return self


func with_category(v) -> Gs2ChatDescribeLatestMessagesRequest:
    category = v
    return self


func with_access_token(v) -> Gs2ChatDescribeLatestMessagesRequest:
    access_token = v
    return self


func with_page_token(v) -> Gs2ChatDescribeLatestMessagesRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2ChatDescribeLatestMessagesRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2ChatDescribeLatestMessagesRequest:
    if data == null:
        return null
    var ret = Gs2ChatDescribeLatestMessagesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["password"] = password
    ret["category"] = category
    ret["accessToken"] = access_token
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret