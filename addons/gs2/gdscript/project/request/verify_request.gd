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
class_name Gs2ProjectVerifyRequest
extends Gs2Request


var verify_token = null


func with_verify_token(v) -> Gs2ProjectVerifyRequest:
    verify_token = v
    return self


static func from_dict(data) -> Gs2ProjectVerifyRequest:
    if data == null:
        return null
    var ret = Gs2ProjectVerifyRequest.new()
    ret.verify_token = null if data.get("verifyToken") == null else str(data.get("verifyToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["verifyToken"] = verify_token
    return ret