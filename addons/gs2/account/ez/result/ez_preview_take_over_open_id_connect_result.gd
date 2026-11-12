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
class_name Gs2AccountEzPreviewTakeOverOpenIdConnectResult
extends RefCounted


var item = null
var ban_statuses = []
var token = null
var expire = 0


static func from_model(model) -> Gs2AccountEzPreviewTakeOverOpenIdConnectResult:
    var ret = Gs2AccountEzPreviewTakeOverOpenIdConnectResult.new()
    ret.item = null if model.item == null else Gs2AccountEzAccount.from_model(model.item)
    ret.ban_statuses = [] if model.ban_statuses == null else model.ban_statuses.map(func(v): return Gs2AccountEzBanStatus.from_model(v))
    ret.token = model.token
    ret.expire = 0 if model.expire == null else model.expire
    return ret