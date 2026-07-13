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
class_name Gs2LogEzInGameLog
extends RefCounted


var timestamp = 0
var user_id = null
var tags = []
var payload = null


func with_timestamp(v) -> Gs2LogEzInGameLog:
    timestamp = v
    return self


func with_user_id(v) -> Gs2LogEzInGameLog:
    user_id = v
    return self


func with_tags(v) -> Gs2LogEzInGameLog:
    tags = v
    return self


func with_payload(v) -> Gs2LogEzInGameLog:
    payload = v
    return self


func to_model() -> Gs2LogInGameLog:
    var ret = Gs2LogInGameLog.new()
    ret.timestamp = timestamp
    ret.user_id = user_id
    ret.tags = null if tags == null else tags.map(func(v): return null if v == null else v.to_model())
    ret.payload = payload
    return ret


static func from_model(model) -> Gs2LogEzInGameLog:
    var ret = Gs2LogEzInGameLog.new()
    ret.timestamp = 0 if model.timestamp == null else model.timestamp
    ret.user_id = model.user_id
    ret.tags = [] if model.tags == null else model.tags.map(func(v): return Gs2LogEzInGameLogTag.from_model(v))
    ret.payload = model.payload
    return ret