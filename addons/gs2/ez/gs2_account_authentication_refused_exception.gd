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
# Not a Gs2UnauthorizedException: 401 is what Gs2Connection.run answers by authenticating again,
# and authenticating again is refused the same way. A Gs2BadRequestException, as in the Unity SDK,
# so callers that caught LoginBySignature's validation error for an empty body still receive it.
class_name Gs2AccountAuthenticationRefusedException
extends Gs2BadRequestException


# The deletion schedule and the like are not copied into fields of their own; they are read from
# item once the Account model carries them.
var item: Gs2AccountAccount = null
# Not Array[Gs2AccountBanStatus]: Authentication returns an untyped array, or null.
var ban_statuses: Variant = null


func _init(item_: Gs2AccountAccount = null, ban_statuses_: Variant = null):
    status_code = 400
    var request_error = Gs2RequestError.new()
    request_error.component = "account"
    request_error.message = "account.authentication.refused"
    errors.append(request_error)
    item = item_
    ban_statuses = ban_statuses_
