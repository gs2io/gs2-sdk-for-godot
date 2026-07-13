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
class_name Gs2SeasonRatingEzSignedBallot
extends RefCounted


var body = null
var signature = null


func with_body(v) -> Gs2SeasonRatingEzSignedBallot:
    body = v
    return self


func with_signature(v) -> Gs2SeasonRatingEzSignedBallot:
    signature = v
    return self


func to_model() -> Gs2SeasonRatingSignedBallot:
    var ret = Gs2SeasonRatingSignedBallot.new()
    ret.body = body
    ret.signature = signature
    return ret


static func from_model(model) -> Gs2SeasonRatingEzSignedBallot:
    var ret = Gs2SeasonRatingEzSignedBallot.new()
    ret.body = model.body
    ret.signature = model.signature
    return ret