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
class_name Gs2RankingSubscribeUser
extends RefCounted


var subscribe_user_id = null
var category_name = null
var user_id = null
var target_user_id = null


func with_subscribe_user_id(v) -> Gs2RankingSubscribeUser:
    subscribe_user_id = v
    return self


func with_category_name(v) -> Gs2RankingSubscribeUser:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingSubscribeUser:
    user_id = v
    return self


func with_target_user_id(v) -> Gs2RankingSubscribeUser:
    target_user_id = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_category_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("categoryName")


static func get_target_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):subscribe:category:(?<categoryName>.+):(?<targetUserId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("targetUserId")


static func from_dict(data) -> Gs2RankingSubscribeUser:
    if data == null:
        return null
    var ret = Gs2RankingSubscribeUser.new()
    ret.subscribe_user_id = null if data.get("subscribeUserId") == null else str(data.get("subscribeUserId"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscribeUserId"] = subscribe_user_id
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["targetUserId"] = target_user_id
    return ret