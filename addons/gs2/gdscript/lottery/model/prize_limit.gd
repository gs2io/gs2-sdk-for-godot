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
class_name Gs2LotteryPrizeLimit
extends RefCounted


var prize_limit_id = null
var prize_id = null
var drawn_count = null
var created_at = null
var updated_at = null
var revision = null


func with_prize_limit_id(v) -> Gs2LotteryPrizeLimit:
    prize_limit_id = v
    return self


func with_prize_id(v) -> Gs2LotteryPrizeLimit:
    prize_id = v
    return self


func with_drawn_count(v) -> Gs2LotteryPrizeLimit:
    drawn_count = v
    return self


func with_created_at(v) -> Gs2LotteryPrizeLimit:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LotteryPrizeLimit:
    updated_at = v
    return self


func with_revision(v) -> Gs2LotteryPrizeLimit:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+):prize:(?<prizeId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+):prize:(?<prizeId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+):prize:(?<prizeId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_prize_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+):prize:(?<prizeId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("prizeTableName")


static func get_prize_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+):prize:(?<prizeId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("prizeId")


static func from_dict(data) -> Gs2LotteryPrizeLimit:
    if data == null:
        return null
    var ret = Gs2LotteryPrizeLimit.new()
    ret.prize_limit_id = null if data.get("prizeLimitId") == null else str(data.get("prizeLimitId"))
    ret.prize_id = null if data.get("prizeId") == null else str(data.get("prizeId"))
    ret.drawn_count = null if data.get("drawnCount") == null else int(data.get("drawnCount"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["prizeLimitId"] = prize_limit_id
    ret["prizeId"] = prize_id
    ret["drawnCount"] = drawn_count
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret