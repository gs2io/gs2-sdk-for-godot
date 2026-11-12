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
class_name Gs2ShowcaseDecrementPurchaseCountByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Showcase:DecrementPurchaseCountByUserId"


static func execute(
    gs2: Gs2DomainCore,
    access_token,
    request: Gs2ShowcaseDecrementPurchaseCountByUserIdRequest
) -> Gs2AsyncResult:
    return Gs2AsyncResult.new(null, null)