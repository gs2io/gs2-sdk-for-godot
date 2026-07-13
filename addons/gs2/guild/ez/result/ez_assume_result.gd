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
class_name Gs2GuildEzAssumeResult
extends RefCounted


var token = null
var user_id = null
var expire = 0


static func from_model(model) -> Gs2GuildEzAssumeResult:
    var ret = Gs2GuildEzAssumeResult.new()
    ret.token = model.token
    ret.user_id = model.user_id
    ret.expire = 0 if model.expire == null else model.expire
    return ret