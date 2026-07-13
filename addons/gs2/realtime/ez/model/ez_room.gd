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
class_name Gs2RealtimeEzRoom
extends RefCounted


var name = null
var ip_address = null
var port = 0
var encryption_key = null


func with_name(v) -> Gs2RealtimeEzRoom:
    name = v
    return self


func with_ip_address(v) -> Gs2RealtimeEzRoom:
    ip_address = v
    return self


func with_port(v) -> Gs2RealtimeEzRoom:
    port = v
    return self


func with_encryption_key(v) -> Gs2RealtimeEzRoom:
    encryption_key = v
    return self


func to_model() -> Gs2RealtimeRoom:
    var ret = Gs2RealtimeRoom.new()
    ret.name = name
    ret.ip_address = ip_address
    ret.port = port
    ret.encryption_key = encryption_key
    return ret


static func from_model(model) -> Gs2RealtimeEzRoom:
    var ret = Gs2RealtimeEzRoom.new()
    ret.name = model.name
    ret.ip_address = model.ip_address
    ret.port = 0 if model.port == null else model.port
    ret.encryption_key = model.encryption_key
    return ret