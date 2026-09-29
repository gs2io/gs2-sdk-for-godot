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
class_name Gs2RestResponse
extends RefCounted


var status_code: int = 0
var body: Variant = null
var body_bytes: PackedByteArray = PackedByteArray()
var error: Gs2Exception
var connect_failed: bool = false


func is_success() -> bool:
    return status_code == 200


static func from_response(status_code_: int, body_text: String) -> Gs2RestResponse:
    var ret = Gs2RestResponse.new()
    ret.status_code = status_code_
    var parsed = null
    if body_text != "":
        var json = JSON.new()
        if json.parse(body_text) == OK:
            parsed = json.data
    if status_code_ == 200:
        ret.body = parsed
    else:
        var message = body_text
        var metadata = null
        if parsed is Dictionary:
            if parsed.get("message") != null:
                message = parsed.get("message")
            metadata = parsed.get("metadata")
        ret.error = Gs2Exception.extract_error(message, status_code_)
        if ret.error != null:
            ret.error.metadata = metadata
    return ret


static func network_error(message, connect_failed_: bool = false) -> Gs2RestResponse:
    var ret = Gs2RestResponse.new()
    ret.status_code = 0
    ret.error = Gs2Exception.extract_error(message, 0)
    ret.connect_failed = connect_failed_
    return ret
