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
class_name Gs2GuildEzSendRequestResult
extends RefCounted


var item = null
var send_member_request = null


static func from_model(model) -> Gs2GuildEzSendRequestResult:
    var ret = Gs2GuildEzSendRequestResult.new()
    ret.item = null if model.item == null else Gs2GuildEzGuild.from_model(model.item)
    ret.send_member_request = null if model.send_member_request == null else Gs2GuildEzSendMemberRequest.from_model(model.send_member_request)
    return ret