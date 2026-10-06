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
class_name Gs2Money2ErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "DepositByUserId":
            if error.has_error_code("wallet.operation.conflict"):
                return Gs2Money2ConflictException.new(error)
        "Withdraw", "WithdrawByUserId":
            if error.has_error_code("wallet.operation.conflict"):
                return Gs2Money2ConflictException.new(error)
            elif error.has_error_code("wallet.balance.insufficient"):
                return Gs2Money2InsufficientException.new(error)
        "VerifyReceipt", "VerifyReceiptByUserId":
            if error.has_error_code("receipt.payload.invalid"):
                return Gs2Money2ReceiptInvalidException.new(error)
        "AllocateSubscriptionStatus", "AllocateSubscriptionStatusByUserId":
            if error.has_error_code("subscription.transaction.used"):
                return Gs2Money2AlreadyUsedException.new(error)
        "TakeoverSubscriptionStatus", "TakeoverSubscriptionStatusByUserId":
            if error.has_error_code("subscription.transaction.used"):
                return Gs2Money2LockPeriodNotElapsedException.new(error)
    return error