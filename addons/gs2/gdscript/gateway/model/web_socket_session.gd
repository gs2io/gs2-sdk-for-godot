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
class_name Gs2GatewayWebSocketSession
extends RefCounted


var web_socket_session_id = null
var connection_id = null
var namespace_name = null
var user_id = null
var session_id = null
var created_at = null
var updated_at = null
var revision = null


func with_web_socket_session_id(v) -> Gs2GatewayWebSocketSession:
    web_socket_session_id = v
    return self


func with_connection_id(v) -> Gs2GatewayWebSocketSession:
    connection_id = v
    return self


func with_namespace_name(v) -> Gs2GatewayWebSocketSession:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2GatewayWebSocketSession:
    user_id = v
    return self


func with_session_id(v) -> Gs2GatewayWebSocketSession:
    session_id = v
    return self


func with_created_at(v) -> Gs2GatewayWebSocketSession:
    created_at = v
    return self


func with_updated_at(v) -> Gs2GatewayWebSocketSession:
    updated_at = v
    return self


func with_revision(v) -> Gs2GatewayWebSocketSession:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):gateway:(?<namespaceName>.+):user:(?<userId>.+):session:(?<connectionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):gateway:(?<namespaceName>.+):user:(?<userId>.+):session:(?<connectionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):gateway:(?<namespaceName>.+):user:(?<userId>.+):session:(?<connectionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):gateway:(?<namespaceName>.+):user:(?<userId>.+):session:(?<connectionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_connection_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):gateway:(?<namespaceName>.+):user:(?<userId>.+):session:(?<connectionId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("connectionId")


static func from_dict(data) -> Gs2GatewayWebSocketSession:
    if data == null:
        return null
    var ret = Gs2GatewayWebSocketSession.new()
    ret.web_socket_session_id = null if data.get("webSocketSessionId") == null else str(data.get("webSocketSessionId"))
    ret.connection_id = null if data.get("connectionId") == null else str(data.get("connectionId"))
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.session_id = null if data.get("sessionId") == null else str(data.get("sessionId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["webSocketSessionId"] = web_socket_session_id
    ret["connectionId"] = connection_id
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["sessionId"] = session_id
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret