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
class_name Gs2Money2EzAppleAppStoreSubscriptionContent
extends RefCounted


var subscription_group_identifier = null


func with_subscription_group_identifier(v) -> Gs2Money2EzAppleAppStoreSubscriptionContent:
    subscription_group_identifier = v
    return self


func to_model() -> Gs2Money2AppleAppStoreSubscriptionContent:
    var ret = Gs2Money2AppleAppStoreSubscriptionContent.new()
    ret.subscription_group_identifier = subscription_group_identifier
    return ret


static func from_model(model) -> Gs2Money2EzAppleAppStoreSubscriptionContent:
    var ret = Gs2Money2EzAppleAppStoreSubscriptionContent.new()
    ret.subscription_group_identifier = model.subscription_group_identifier
    return ret