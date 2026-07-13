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
class_name Gs2Money2EzSubscribeTransaction
extends RefCounted


var content_name = null
var store = null
var transaction_id = null
var status_detail = null
var expires_at = 0


func with_content_name(v) -> Gs2Money2EzSubscribeTransaction:
    content_name = v
    return self


func with_store(v) -> Gs2Money2EzSubscribeTransaction:
    store = v
    return self


func with_transaction_id(v) -> Gs2Money2EzSubscribeTransaction:
    transaction_id = v
    return self


func with_status_detail(v) -> Gs2Money2EzSubscribeTransaction:
    status_detail = v
    return self


func with_expires_at(v) -> Gs2Money2EzSubscribeTransaction:
    expires_at = v
    return self


func to_model() -> Gs2Money2SubscribeTransaction:
    var ret = Gs2Money2SubscribeTransaction.new()
    ret.content_name = content_name
    ret.store = store
    ret.transaction_id = transaction_id
    ret.status_detail = status_detail
    ret.expires_at = expires_at
    return ret


static func from_model(model) -> Gs2Money2EzSubscribeTransaction:
    var ret = Gs2Money2EzSubscribeTransaction.new()
    ret.content_name = model.content_name
    ret.store = model.store
    ret.transaction_id = model.transaction_id
    ret.status_detail = model.status_detail
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    return ret