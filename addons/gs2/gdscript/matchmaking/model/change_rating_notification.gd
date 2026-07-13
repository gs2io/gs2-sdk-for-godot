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
class_name Gs2MatchmakingChangeRatingNotification
extends RefCounted


var namespace_name = null
var rating_name = null
var user_id = null
var rate_value = null


func with_namespace_name(v) -> Gs2MatchmakingChangeRatingNotification:
    namespace_name = v
    return self


func with_rating_name(v) -> Gs2MatchmakingChangeRatingNotification:
    rating_name = v
    return self


func with_user_id(v) -> Gs2MatchmakingChangeRatingNotification:
    user_id = v
    return self


func with_rate_value(v) -> Gs2MatchmakingChangeRatingNotification:
    rate_value = v
    return self


static func from_dict(data) -> Gs2MatchmakingChangeRatingNotification:
    if data == null:
        return null
    var ret = Gs2MatchmakingChangeRatingNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rating_name = null if data.get("ratingName") == null else str(data.get("ratingName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.rate_value = null if data.get("rateValue") == null else float(data.get("rateValue"))
    return ret