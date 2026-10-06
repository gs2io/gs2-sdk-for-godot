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
class_name Gs2AccountErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "Authentication":
            if error.has_error_code("account.password.invalid"):
                return Gs2AccountPasswordIncorrectException.new(error)
            elif error.has_error_code("account.banned.infinity"):
                return Gs2AccountBannedInfinityException.new(error)
        "CreateTakeOver", "CreateTakeOverByUserId", "CreateTakeOverOpenIdConnect", "CreateTakeOverOpenIdConnectAndByUserId":
            if error.has_error_code("account.takeOver.alreadyExists"):
                return Gs2AccountTakeOverAlreadyExistsException.new(error)
            elif error.has_error_code("account.takeOver.userIdentifier.duplicate"):
                return Gs2AccountTakeOverIdentifierAlreadyUsedException.new(error)
        "UpdateTakeOver", "UpdateTakeOverByUserId", "DoTakeOver":
            if error.has_error_code("account.password.invalid"):
                return Gs2AccountPasswordIncorrectException.new(error)
    return error