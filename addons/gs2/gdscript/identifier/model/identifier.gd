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
class_name Gs2IdentifierIdentifier
extends RefCounted


var client_id = null
var user_name = null
var client_secret = null
var created_at = null
var revision = null


func with_client_id(v) -> Gs2IdentifierIdentifier:
    client_id = v
    return self


func with_user_name(v) -> Gs2IdentifierIdentifier:
    user_name = v
    return self


func with_client_secret(v) -> Gs2IdentifierIdentifier:
    client_secret = v
    return self


func with_created_at(v) -> Gs2IdentifierIdentifier:
    created_at = v
    return self


func with_revision(v) -> Gs2IdentifierIdentifier:
    revision = v
    return self


static func from_dict(data) -> Gs2IdentifierIdentifier:
    if data == null:
        return null
    var ret = Gs2IdentifierIdentifier.new()
    ret.client_id = null if data.get("clientId") == null else str(data.get("clientId"))
    ret.user_name = null if data.get("userName") == null else str(data.get("userName"))
    ret.client_secret = null if data.get("clientSecret") == null else str(data.get("clientSecret"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["clientId"] = client_id
    ret["userName"] = user_name
    ret["clientSecret"] = client_secret
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret