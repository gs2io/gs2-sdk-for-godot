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
class_name Gs2IdentifierLoginResult
extends RefCounted


var access_token = null
var token_type = null
var expires_in = null
var owner_id = null
var metadata = null


func with_access_token(v) -> Gs2IdentifierLoginResult:
    access_token = v
    return self


func with_token_type(v) -> Gs2IdentifierLoginResult:
    token_type = v
    return self


func with_expires_in(v) -> Gs2IdentifierLoginResult:
    expires_in = v
    return self


func with_owner_id(v) -> Gs2IdentifierLoginResult:
    owner_id = v
    return self


func with_metadata(v) -> Gs2IdentifierLoginResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2IdentifierLoginResult:
    if data == null:
        return null
    var ret = Gs2IdentifierLoginResult.new()
    ret.access_token = null if data.get("access_token") == null else str(data.get("access_token"))
    ret.token_type = null if data.get("token_type") == null else str(data.get("token_type"))
    ret.expires_in = null if data.get("expires_in") == null else int(data.get("expires_in"))
    ret.owner_id = null if data.get("owner_id") == null else str(data.get("owner_id"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accessToken"] = access_token
    ret["tokenType"] = token_type
    ret["expiresIn"] = expires_in
    ret["ownerId"] = owner_id
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret