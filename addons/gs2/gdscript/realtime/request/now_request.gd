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
class_name Gs2RealtimeNowRequest
extends Gs2Request


var access_token = null


func with_access_token(v) -> Gs2RealtimeNowRequest:
    access_token = v
    return self


static func from_dict(data) -> Gs2RealtimeNowRequest:
    if data == null:
        return null
    var ret = Gs2RealtimeNowRequest.new()
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accessToken"] = access_token
    return ret