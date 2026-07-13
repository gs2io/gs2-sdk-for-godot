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
class_name Gs2Money2SubscriptionStatus
extends RefCounted


var user_id = null
var content_name = null
var status = null
var expires_at = null
var detail = null


func with_user_id(v) -> Gs2Money2SubscriptionStatus:
    user_id = v
    return self


func with_content_name(v) -> Gs2Money2SubscriptionStatus:
    content_name = v
    return self


func with_status(v) -> Gs2Money2SubscriptionStatus:
    status = v
    return self


func with_expires_at(v) -> Gs2Money2SubscriptionStatus:
    expires_at = v
    return self


func with_detail(v) -> Gs2Money2SubscriptionStatus:
    detail = v
    return self


static func from_dict(data) -> Gs2Money2SubscriptionStatus:
    if data == null:
        return null
    var ret = Gs2Money2SubscriptionStatus.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.detail = null if data.get("detail") == null else data.get("detail").map(func(v): return Gs2Money2SubscribeTransaction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["contentName"] = content_name
    ret["status"] = status
    ret["expiresAt"] = expires_at
    ret["detail"] = null if detail == null else detail.map(func(v): return null if v == null else v.to_dict())
    return ret