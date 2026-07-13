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
class_name Gs2LotteryPrizeTableMaster
extends RefCounted


var prize_table_id = null
var name = null
var metadata = null
var description = null
var prizes = null
var created_at = null
var updated_at = null
var revision = null


func with_prize_table_id(v) -> Gs2LotteryPrizeTableMaster:
    prize_table_id = v
    return self


func with_name(v) -> Gs2LotteryPrizeTableMaster:
    name = v
    return self


func with_metadata(v) -> Gs2LotteryPrizeTableMaster:
    metadata = v
    return self


func with_description(v) -> Gs2LotteryPrizeTableMaster:
    description = v
    return self


func with_prizes(v) -> Gs2LotteryPrizeTableMaster:
    prizes = v
    return self


func with_created_at(v) -> Gs2LotteryPrizeTableMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2LotteryPrizeTableMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2LotteryPrizeTableMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_prize_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lottery:(?<namespaceName>.+):table:(?<prizeTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("prizeTableName")


static func from_dict(data) -> Gs2LotteryPrizeTableMaster:
    if data == null:
        return null
    var ret = Gs2LotteryPrizeTableMaster.new()
    ret.prize_table_id = null if data.get("prizeTableId") == null else str(data.get("prizeTableId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.prizes = null if data.get("prizes") == null else data.get("prizes").map(func(v): return Gs2LotteryPrize.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["prizeTableId"] = prize_table_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["prizes"] = null if prizes == null else prizes.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret