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
class_name Gs2Money2WalletDepositByUserIdExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2Money2DepositByUserIdRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2Money2DepositByUserIdRequest
):
    var clone = item.get_script().from_dict(item.to_dict())
    for deposit_transaction in (request.deposit_transactions if request.deposit_transactions != null else []):
        if deposit_transaction.price == 0:
            clone.summary.free_ += deposit_transaction.count
        else:
            clone.summary.paid += deposit_transaction.count
        clone.summary.total += deposit_transaction.count
    return clone


static func rate(
    request: Gs2Money2DepositByUserIdRequest,
    rate_value
) -> Gs2Money2DepositByUserIdRequest:
    push_error("not supported rate action Gs2Money2:DepositByUserId")
    return request
