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
class_name Gs2GatewayEzWebSocketSession
extends RefCounted


var connection_id = null
var namespace_name = null
var user_id = null


func with_connection_id(v) -> Gs2GatewayEzWebSocketSession:
    connection_id = v
    return self


func with_namespace_name(v) -> Gs2GatewayEzWebSocketSession:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2GatewayEzWebSocketSession:
    user_id = v
    return self


func to_model() -> Gs2GatewayWebSocketSession:
    var ret = Gs2GatewayWebSocketSession.new()
    ret.connection_id = connection_id
    ret.namespace_name = namespace_name
    ret.user_id = user_id
    return ret


static func from_model(model) -> Gs2GatewayEzWebSocketSession:
    var ret = Gs2GatewayEzWebSocketSession.new()
    ret.connection_id = model.connection_id
    ret.namespace_name = model.namespace_name
    ret.user_id = model.user_id
    return ret