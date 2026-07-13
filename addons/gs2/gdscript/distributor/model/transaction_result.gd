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
class_name Gs2DistributorTransactionResult
extends RefCounted


var transaction_result_id = null
var user_id = null
var transaction_id = null
var verify_results = null
var consume_results = null
var acquire_results = null
var has_error = null
var created_at = null
var revision = null


func with_transaction_result_id(v) -> Gs2DistributorTransactionResult:
    transaction_result_id = v
    return self


func with_user_id(v) -> Gs2DistributorTransactionResult:
    user_id = v
    return self


func with_transaction_id(v) -> Gs2DistributorTransactionResult:
    transaction_id = v
    return self


func with_verify_results(v) -> Gs2DistributorTransactionResult:
    verify_results = v
    return self


func with_consume_results(v) -> Gs2DistributorTransactionResult:
    consume_results = v
    return self


func with_acquire_results(v) -> Gs2DistributorTransactionResult:
    acquire_results = v
    return self


func with_has_error(v) -> Gs2DistributorTransactionResult:
    has_error = v
    return self


func with_created_at(v) -> Gs2DistributorTransactionResult:
    created_at = v
    return self


func with_revision(v) -> Gs2DistributorTransactionResult:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):transaction:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):transaction:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):transaction:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):transaction:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):distributor:(?<namespaceName>.+):user:(?<userId>.+):transaction:result:(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2DistributorTransactionResult:
    if data == null:
        return null
    var ret = Gs2DistributorTransactionResult.new()
    ret.transaction_result_id = null if data.get("transactionResultId") == null else str(data.get("transactionResultId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.verify_results = null if data.get("verifyResults") == null else data.get("verifyResults").map(func(v): return Gs2DistributorVerifyActionResult.from_dict(v))
    ret.consume_results = null if data.get("consumeResults") == null else data.get("consumeResults").map(func(v): return Gs2DistributorConsumeActionResult.from_dict(v))
    ret.acquire_results = null if data.get("acquireResults") == null else data.get("acquireResults").map(func(v): return Gs2DistributorAcquireActionResult.from_dict(v))
    ret.has_error = null if data.get("hasError") == null else bool(data.get("hasError"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["transactionResultId"] = transaction_result_id
    ret["userId"] = user_id
    ret["transactionId"] = transaction_id
    ret["verifyResults"] = null if verify_results == null else verify_results.map(func(v): return null if v == null else v.to_dict())
    ret["consumeResults"] = null if consume_results == null else consume_results.map(func(v): return null if v == null else v.to_dict())
    ret["acquireResults"] = null if acquire_results == null else acquire_results.map(func(v): return null if v == null else v.to_dict())
    ret["hasError"] = has_error
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret