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
class_name Gs2Money2AppleAppStoreSubscriptionContent
extends RefCounted


var subscription_group_identifier = null


func with_subscription_group_identifier(v) -> Gs2Money2AppleAppStoreSubscriptionContent:
    subscription_group_identifier = v
    return self


static func from_dict(data) -> Gs2Money2AppleAppStoreSubscriptionContent:
    if data == null:
        return null
    var ret = Gs2Money2AppleAppStoreSubscriptionContent.new()
    ret.subscription_group_identifier = null if data.get("subscriptionGroupIdentifier") == null else str(data.get("subscriptionGroupIdentifier"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscriptionGroupIdentifier"] = subscription_group_identifier
    return ret