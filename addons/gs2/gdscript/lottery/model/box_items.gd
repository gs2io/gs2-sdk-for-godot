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
class_name Gs2LotteryBoxItems
extends RefCounted


var box_id = null
var prize_table_name = null
var user_id = null
var items = null


func with_box_id(v) -> Gs2LotteryBoxItems:
    box_id = v
    return self


func with_prize_table_name(v) -> Gs2LotteryBoxItems:
    prize_table_name = v
    return self


func with_user_id(v) -> Gs2LotteryBoxItems:
    user_id = v
    return self


func with_items(v) -> Gs2LotteryBoxItems:
    items = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):user:(?<userId>.+):box:items:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):user:(?<userId>.+):box:items:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):user:(?<userId>.+):box:items:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):user:(?<userId>.+):box:items:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_prize_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):user:(?<userId>.+):box:items:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("prizeTableName")


static func from_dict(data) -> Gs2LotteryBoxItems:
    if data == null:
        return null
    var ret = Gs2LotteryBoxItems.new()
    ret.box_id = null if data.get("boxId") == null else str(data.get("boxId"))
    ret.prize_table_name = null if data.get("prizeTableName") == null else str(data.get("prizeTableName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.items = null if data.get("items") == null else data.get("items").map(func(v): return Gs2LotteryBoxItem.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["boxId"] = box_id
    ret["prizeTableName"] = prize_table_name
    ret["userId"] = user_id
    ret["items"] = null if items == null else items.map(func(v): return null if v == null else v.to_dict())
    return ret