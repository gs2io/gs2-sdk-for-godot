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
class_name Gs2Money2AppleAppStoreSetting
extends RefCounted


var bundle_id = null
var shared_secret_key = null
var issuer_id = null
var key_id = null
var private_key_pem = null


func with_bundle_id(v) -> Gs2Money2AppleAppStoreSetting:
    bundle_id = v
    return self


func with_shared_secret_key(v) -> Gs2Money2AppleAppStoreSetting:
    shared_secret_key = v
    return self


func with_issuer_id(v) -> Gs2Money2AppleAppStoreSetting:
    issuer_id = v
    return self


func with_key_id(v) -> Gs2Money2AppleAppStoreSetting:
    key_id = v
    return self


func with_private_key_pem(v) -> Gs2Money2AppleAppStoreSetting:
    private_key_pem = v
    return self


static func from_dict(data) -> Gs2Money2AppleAppStoreSetting:
    if data == null:
        return null
    var ret = Gs2Money2AppleAppStoreSetting.new()
    ret.bundle_id = null if data.get("bundleId") == null else str(data.get("bundleId"))
    ret.shared_secret_key = null if data.get("sharedSecretKey") == null else str(data.get("sharedSecretKey"))
    ret.issuer_id = null if data.get("issuerId") == null else str(data.get("issuerId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.private_key_pem = null if data.get("privateKeyPem") == null else str(data.get("privateKeyPem"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["bundleId"] = bundle_id
    ret["sharedSecretKey"] = shared_secret_key
    ret["issuerId"] = issuer_id
    ret["keyId"] = key_id
    ret["privateKeyPem"] = private_key_pem
    return ret