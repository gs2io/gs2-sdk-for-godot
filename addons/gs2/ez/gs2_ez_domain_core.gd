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

class_name Gs2EzDomainCore
extends RefCounted


var connection: Gs2Connection
var _gs2: Gs2DomainCore
var _service_domains: Dictionary = {}


func _init(connection_: Gs2Connection, distributor_namespace_name = null, gs2_: Gs2DomainCore = null):
    connection = connection_
    if gs2_ == null:
        gs2_ = Gs2DomainCore.new(
            connection_.rest_session,
            connection_.web_socket_session,
            distributor_namespace_name
        )
    _gs2 = gs2_


func service_domain(service_class_name: String):
    if _service_domains.has(service_class_name):
        return _service_domains[service_class_name]
    var script = Gs2ClassRegistry.resolve(service_class_name)
    if script == null:
        return null
    var domain = script.new(self)
    _service_domains[service_class_name] = domain
    return domain


func _get(property: StringName):
    var name = String(property)
    if name == "gs2" or name == "super_":
        return _gs2
    if name.begins_with("_"):
        return null
    return service_domain("Gs2" + name.trim_suffix("_").to_pascal_case() + "EzDomain")


func dispatch(game_session) -> Gs2AsyncResult:
    return await _gs2.dispatch(game_session.access_token)


func load_user_data(game_session) -> Gs2AsyncResult:
    return await _gs2.load_user_data(game_session.access_token)


func clear_cache() -> void:
    _gs2.clear_cache()
