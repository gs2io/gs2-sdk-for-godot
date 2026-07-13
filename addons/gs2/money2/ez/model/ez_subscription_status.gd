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
class_name Gs2Money2EzSubscriptionStatus
extends RefCounted


var content_name = null
var user_id = null
var status = null
var expires_at = 0
var detail = []


func with_content_name(v) -> Gs2Money2EzSubscriptionStatus:
    content_name = v
    return self


func with_user_id(v) -> Gs2Money2EzSubscriptionStatus:
    user_id = v
    return self


func with_status(v) -> Gs2Money2EzSubscriptionStatus:
    status = v
    return self


func with_expires_at(v) -> Gs2Money2EzSubscriptionStatus:
    expires_at = v
    return self


func with_detail(v) -> Gs2Money2EzSubscriptionStatus:
    detail = v
    return self


func to_model() -> Gs2Money2SubscriptionStatus:
    var ret = Gs2Money2SubscriptionStatus.new()
    ret.content_name = content_name
    ret.user_id = user_id
    ret.status = status
    ret.expires_at = expires_at
    ret.detail = null if detail == null else detail.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2Money2EzSubscriptionStatus:
    var ret = Gs2Money2EzSubscriptionStatus.new()
    ret.content_name = model.content_name
    ret.user_id = model.user_id
    ret.status = model.status
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    ret.detail = [] if model.detail == null else model.detail.map(func(v): return Gs2Money2EzSubscribeTransaction.from_model(v))
    return ret