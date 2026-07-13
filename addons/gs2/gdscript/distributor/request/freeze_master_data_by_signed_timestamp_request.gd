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
class_name Gs2DistributorFreezeMasterDataBySignedTimestampRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var body = null
var signature = null
var key_id = null


func with_namespace_name(v) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    access_token = v
    return self


func with_body(v) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    body = v
    return self


func with_signature(v) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    signature = v
    return self


func with_key_id(v) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2DistributorFreezeMasterDataBySignedTimestampRequest:
    if data == null:
        return null
    var ret = Gs2DistributorFreezeMasterDataBySignedTimestampRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["body"] = body
    ret["signature"] = signature
    ret["keyId"] = key_id
    return ret