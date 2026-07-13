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
class_name Gs2LockMutex
extends RefCounted


var mutex_id = null
var user_id = null
var property_id = null
var transaction_id = null
var created_at = null
var ttl_at = null
var revision = null


func with_mutex_id(v) -> Gs2LockMutex:
    mutex_id = v
    return self


func with_user_id(v) -> Gs2LockMutex:
    user_id = v
    return self


func with_property_id(v) -> Gs2LockMutex:
    property_id = v
    return self


func with_transaction_id(v) -> Gs2LockMutex:
    transaction_id = v
    return self


func with_created_at(v) -> Gs2LockMutex:
    created_at = v
    return self


func with_ttl_at(v) -> Gs2LockMutex:
    ttl_at = v
    return self


func with_revision(v) -> Gs2LockMutex:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lock:(?<namespaceName>.+):user:(?<userId>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lock:(?<namespaceName>.+):user:(?<userId>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lock:(?<namespaceName>.+):user:(?<userId>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lock:(?<namespaceName>.+):user:(?<userId>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_property_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):lock:(?<namespaceName>.+):user:(?<userId>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyId")


static func from_dict(data) -> Gs2LockMutex:
    if data == null:
        return null
    var ret = Gs2LockMutex.new()
    ret.mutex_id = null if data.get("mutexId") == null else str(data.get("mutexId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.ttl_at = null if data.get("ttlAt") == null else int(data.get("ttlAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["mutexId"] = mutex_id
    ret["userId"] = user_id
    ret["propertyId"] = property_id
    ret["transactionId"] = transaction_id
    ret["createdAt"] = created_at
    ret["ttlAt"] = ttl_at
    ret["revision"] = revision
    return ret