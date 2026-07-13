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
class_name Gs2ProjectWaitCleanUserDataRequest
extends Gs2Request


var owner_id = null
var transaction_id = null
var user_id = null
var time_offset_token = null
var duplication_avoider = null


func with_owner_id(v) -> Gs2ProjectWaitCleanUserDataRequest:
    owner_id = v
    return self


func with_transaction_id(v) -> Gs2ProjectWaitCleanUserDataRequest:
    transaction_id = v
    return self


func with_user_id(v) -> Gs2ProjectWaitCleanUserDataRequest:
    user_id = v
    return self


func with_time_offset_token(v) -> Gs2ProjectWaitCleanUserDataRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ProjectWaitCleanUserDataRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ProjectWaitCleanUserDataRequest:
    if data == null:
        return null
    var ret = Gs2ProjectWaitCleanUserDataRequest.new()
    ret.owner_id = null if data.get("ownerId") == null else str(data.get("ownerId"))
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["ownerId"] = owner_id
    ret["transactionId"] = transaction_id
    ret["userId"] = user_id
    ret["timeOffsetToken"] = time_offset_token
    return ret