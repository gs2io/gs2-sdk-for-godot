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
class_name Gs2Money2SubscribeTransaction
extends RefCounted


var subscribe_transaction_id = null
var content_name = null
var transaction_id = null
var store = null
var user_id = null
var status_detail = null
var expires_at = null
var last_allocated_at = null
var last_take_over_at = null
var created_at = null
var updated_at = null
var revision = null


func with_subscribe_transaction_id(v) -> Gs2Money2SubscribeTransaction:
    subscribe_transaction_id = v
    return self


func with_content_name(v) -> Gs2Money2SubscribeTransaction:
    content_name = v
    return self


func with_transaction_id(v) -> Gs2Money2SubscribeTransaction:
    transaction_id = v
    return self


func with_store(v) -> Gs2Money2SubscribeTransaction:
    store = v
    return self


func with_user_id(v) -> Gs2Money2SubscribeTransaction:
    user_id = v
    return self


func with_status_detail(v) -> Gs2Money2SubscribeTransaction:
    status_detail = v
    return self


func with_expires_at(v) -> Gs2Money2SubscribeTransaction:
    expires_at = v
    return self


func with_last_allocated_at(v) -> Gs2Money2SubscribeTransaction:
    last_allocated_at = v
    return self


func with_last_take_over_at(v) -> Gs2Money2SubscribeTransaction:
    last_take_over_at = v
    return self


func with_created_at(v) -> Gs2Money2SubscribeTransaction:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Money2SubscribeTransaction:
    updated_at = v
    return self


func with_revision(v) -> Gs2Money2SubscribeTransaction:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):subscriptionTransaction:(?<contentName>.+):(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):subscriptionTransaction:(?<contentName>.+):(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):subscriptionTransaction:(?<contentName>.+):(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_content_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):subscriptionTransaction:(?<contentName>.+):(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("contentName")


static func get_transaction_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):money2:(?<namespaceName>.+):subscriptionTransaction:(?<contentName>.+):(?<transactionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("transactionId")


static func from_dict(data) -> Gs2Money2SubscribeTransaction:
    if data == null:
        return null
    var ret = Gs2Money2SubscribeTransaction.new()
    ret.subscribe_transaction_id = null if data.get("subscribeTransactionId") == null else str(data.get("subscribeTransactionId"))
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.store = null if data.get("store") == null else str(data.get("store"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.status_detail = null if data.get("statusDetail") == null else str(data.get("statusDetail"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.last_allocated_at = null if data.get("lastAllocatedAt") == null else int(data.get("lastAllocatedAt"))
    ret.last_take_over_at = null if data.get("lastTakeOverAt") == null else int(data.get("lastTakeOverAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscribeTransactionId"] = subscribe_transaction_id
    ret["contentName"] = content_name
    ret["transactionId"] = transaction_id
    ret["store"] = store
    ret["userId"] = user_id
    ret["statusDetail"] = status_detail
    ret["expiresAt"] = expires_at
    ret["lastAllocatedAt"] = last_allocated_at
    ret["lastTakeOverAt"] = last_take_over_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret