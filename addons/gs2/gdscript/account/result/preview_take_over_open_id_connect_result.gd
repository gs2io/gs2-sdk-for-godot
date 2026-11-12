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
class_name Gs2AccountPreviewTakeOverOpenIdConnectResult
extends RefCounted


var item = null
var ban_statuses = null
var token = null
var expire = null
var metadata = null


func with_item(v) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    item = v
    return self


func with_ban_statuses(v) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    ban_statuses = v
    return self


func with_token(v) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    token = v
    return self


func with_expire(v) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    expire = v
    return self


func with_metadata(v) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2AccountPreviewTakeOverOpenIdConnectResult:
    if data == null:
        return null
    var ret = Gs2AccountPreviewTakeOverOpenIdConnectResult.new()
    ret.item = null if data.get("item") == null else Gs2AccountAccount.from_dict(data.get("item"))
    ret.ban_statuses = null if data.get("banStatuses") == null else data.get("banStatuses").map(func(v): return Gs2AccountBanStatus.from_dict(v))
    ret.token = null if data.get("token") == null else str(data.get("token"))
    ret.expire = null if data.get("expire") == null else int(data.get("expire"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["banStatuses"] = null if ban_statuses == null else ban_statuses.map(func(v): return null if v == null else v.to_dict())
    ret["token"] = token
    ret["expire"] = expire
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret