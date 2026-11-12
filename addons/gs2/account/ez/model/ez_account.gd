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
class_name Gs2AccountEzAccount
extends RefCounted


var user_id = null
var password = null
var created_at = 0
var deletion_scheduled_at = 0


func with_user_id(v) -> Gs2AccountEzAccount:
    user_id = v
    return self


func with_password(v) -> Gs2AccountEzAccount:
    password = v
    return self


func with_created_at(v) -> Gs2AccountEzAccount:
    created_at = v
    return self


func with_deletion_scheduled_at(v) -> Gs2AccountEzAccount:
    deletion_scheduled_at = v
    return self


func to_model() -> Gs2AccountAccount:
    var ret = Gs2AccountAccount.new()
    ret.user_id = user_id
    ret.password = password
    ret.created_at = created_at
    ret.deletion_scheduled_at = deletion_scheduled_at
    return ret


static func from_model(model) -> Gs2AccountEzAccount:
    var ret = Gs2AccountEzAccount.new()
    ret.user_id = model.user_id
    ret.password = model.password
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.deletion_scheduled_at = 0 if model.deletion_scheduled_at == null else model.deletion_scheduled_at
    return ret