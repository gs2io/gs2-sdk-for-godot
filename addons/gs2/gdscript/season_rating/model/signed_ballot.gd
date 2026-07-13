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
class_name Gs2SeasonRatingSignedBallot
extends RefCounted


var body = null
var signature = null


func with_body(v) -> Gs2SeasonRatingSignedBallot:
    body = v
    return self


func with_signature(v) -> Gs2SeasonRatingSignedBallot:
    signature = v
    return self


static func from_dict(data) -> Gs2SeasonRatingSignedBallot:
    if data == null:
        return null
    var ret = Gs2SeasonRatingSignedBallot.new()
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["body"] = body
    ret["signature"] = signature
    return ret