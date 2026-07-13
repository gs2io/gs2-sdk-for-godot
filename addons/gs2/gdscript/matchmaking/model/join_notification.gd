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
class_name Gs2MatchmakingJoinNotification
extends RefCounted


var namespace_name = null
var gathering_name = null
var join_user_id = null


func with_namespace_name(v) -> Gs2MatchmakingJoinNotification:
    namespace_name = v
    return self


func with_gathering_name(v) -> Gs2MatchmakingJoinNotification:
    gathering_name = v
    return self


func with_join_user_id(v) -> Gs2MatchmakingJoinNotification:
    join_user_id = v
    return self


static func from_dict(data) -> Gs2MatchmakingJoinNotification:
    if data == null:
        return null
    var ret = Gs2MatchmakingJoinNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.gathering_name = null if data.get("gatheringName") == null else str(data.get("gatheringName"))
    ret.join_user_id = null if data.get("joinUserId") == null else str(data.get("joinUserId"))
    return ret