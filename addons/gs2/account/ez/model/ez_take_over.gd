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
class_name Gs2AccountEzTakeOver
extends RefCounted


var user_id = null
var type = 0
var user_identifier = null
var created_at = 0
var expires_at = 0


func with_user_id(v) -> Gs2AccountEzTakeOver:
    user_id = v
    return self


func with_type(v) -> Gs2AccountEzTakeOver:
    type = v
    return self


func with_user_identifier(v) -> Gs2AccountEzTakeOver:
    user_identifier = v
    return self


func with_created_at(v) -> Gs2AccountEzTakeOver:
    created_at = v
    return self


func with_expires_at(v) -> Gs2AccountEzTakeOver:
    expires_at = v
    return self


func to_model() -> Gs2AccountTakeOver:
    var ret = Gs2AccountTakeOver.new()
    ret.user_id = user_id
    ret.type = type
    ret.user_identifier = user_identifier
    ret.created_at = created_at
    ret.expires_at = expires_at
    return ret


static func from_model(model) -> Gs2AccountEzTakeOver:
    var ret = Gs2AccountEzTakeOver.new()
    ret.user_id = model.user_id
    ret.type = 0 if model.type == null else model.type
    ret.user_identifier = model.user_identifier
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    return ret