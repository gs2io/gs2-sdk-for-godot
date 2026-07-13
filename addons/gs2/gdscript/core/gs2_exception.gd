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
class_name Gs2Exception
extends RefCounted


const SCRIPT_MAP = {
    0: "no_internet_connection_exception.gd",
    400: "bad_request_exception.gd",
    401: "unauthorized_exception.gd",
    402: "quota_limit_exceeded_exception.gd",
    404: "not_found_exception.gd",
    409: "conflict_exception.gd",
    500: "internal_server_error_exception.gd",
    502: "bad_gateway_exception.gd",
    503: "service_unavailable_exception.gd",
    504: "request_timeout_exception.gd",
}

var status_code: int = 0
var errors: Array[Gs2RequestError] = []
var metadata: Variant = null


static func extract_error(message, status_code_) -> Gs2Exception:
    if status_code_ == 200:
        return null
    var script_path = _exception_script_path(
        SCRIPT_MAP.get(status_code_, "unknown_exception.gd")
    )
    var ret = load(script_path).new() as Gs2Exception
    ret.status_code = status_code_
    var parsed = message
    if message is String:
        parsed = null
        if message != "":
            var json = JSON.new()
            if json.parse(message) == OK:
                parsed = json.data
    if parsed is Array:
        for v in parsed:
            if v is Dictionary:
                ret.errors.append(Gs2RequestError.from_dict(v))
    elif parsed is Dictionary:
        ret.errors.append(Gs2RequestError.from_dict(parsed))
    else:
        var request_error = Gs2RequestError.new()
        request_error.component = "unknown"
        request_error.message = message
        ret.errors.append(request_error)
    return ret


static func session_not_open() -> Gs2Exception:
    var ret = load(_exception_script_path("session_not_open_exception.gd")).new() as Gs2Exception
    ret.status_code = 401
    var request_error = Gs2RequestError.new()
    request_error.component = "session"
    request_error.message = "session.state.error.notOpen"
    ret.errors.append(request_error)
    return ret


func is_unauthorized() -> bool:
    return inherits_script(_exception_script_path("unauthorized_exception.gd"))


func is_session_not_open() -> bool:
    return inherits_script(_exception_script_path("session_not_open_exception.gd"))


static func _exception_script_path(file_name: String) -> String:
    for directory in [
        "res://addons/gs2/gdscript/core/exception",
        "res://addons/gs2/core/exception",
    ]:
        var script_path = directory.path_join(file_name)
        if ResourceLoader.exists(script_path):
            return script_path
    return "res://addons/gs2/core/exception".path_join(file_name)


func copy_from(source: Gs2Exception) -> Gs2Exception:
    status_code = source.status_code
    errors = source.errors.duplicate()
    metadata = source.metadata
    return self


func has_error_code(code: String) -> bool:
    for error in errors:
        if error != null and error.code == code:
            return true
    return false


func inherits_script(script_path: String) -> bool:
    var current_script = get_script()
    while current_script != null:
        if current_script.resource_path == script_path:
            return true
        current_script = current_script.get_base_script()
    return false


func _to_string() -> String:
    var messages = []
    for v in errors:
        messages.append("" if v.message == null else str(v.message))
    var exception_name = "Gs2Exception"
    var current_script = get_script()
    if current_script != null and current_script.get_global_name() != "":
        exception_name = current_script.get_global_name()
    return "%s(%d): %s" % [exception_name, status_code, ", ".join(messages)]
