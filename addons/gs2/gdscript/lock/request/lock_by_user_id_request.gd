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
class_name Gs2LockLockByUserIdRequest
extends Gs2Request


var namespace_name = null
var property_id = null
var user_id = null
var transaction_id = null
var ttl = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LockLockByUserIdRequest:
    namespace_name = v
    return self


func with_property_id(v) -> Gs2LockLockByUserIdRequest:
    property_id = v
    return self


func with_user_id(v) -> Gs2LockLockByUserIdRequest:
    user_id = v
    return self


func with_transaction_id(v) -> Gs2LockLockByUserIdRequest:
    transaction_id = v
    return self


func with_ttl(v) -> Gs2LockLockByUserIdRequest:
    ttl = v
    return self


func with_time_offset_token(v) -> Gs2LockLockByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2LockLockByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LockLockByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2LockLockByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.ttl = null if data.get("ttl") == null else int(data.get("ttl"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["propertyId"] = property_id
    ret["userId"] = user_id
    ret["transactionId"] = transaction_id
    ret["ttl"] = ttl
    ret["timeOffsetToken"] = time_offset_token
    return ret