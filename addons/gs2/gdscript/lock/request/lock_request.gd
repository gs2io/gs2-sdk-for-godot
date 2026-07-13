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
class_name Gs2LockLockRequest
extends Gs2Request


var namespace_name = null
var property_id = null
var access_token = null
var transaction_id = null
var ttl = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LockLockRequest:
    namespace_name = v
    return self


func with_property_id(v) -> Gs2LockLockRequest:
    property_id = v
    return self


func with_access_token(v) -> Gs2LockLockRequest:
    access_token = v
    return self


func with_transaction_id(v) -> Gs2LockLockRequest:
    transaction_id = v
    return self


func with_ttl(v) -> Gs2LockLockRequest:
    ttl = v
    return self


func with_duplication_avoider(v) -> Gs2LockLockRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LockLockRequest:
    if data == null:
        return null
    var ret = Gs2LockLockRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.ttl = null if data.get("ttl") == null else int(data.get("ttl"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["propertyId"] = property_id
    ret["accessToken"] = access_token
    ret["transactionId"] = transaction_id
    ret["ttl"] = ttl
    return ret