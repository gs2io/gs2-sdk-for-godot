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
class_name Gs2VersionCalculateSignatureResult
extends RefCounted


var body = null
var signature = null
var metadata = null


func with_body(v) -> Gs2VersionCalculateSignatureResult:
    body = v
    return self


func with_signature(v) -> Gs2VersionCalculateSignatureResult:
    signature = v
    return self


func with_metadata(v) -> Gs2VersionCalculateSignatureResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2VersionCalculateSignatureResult:
    if data == null:
        return null
    var ret = Gs2VersionCalculateSignatureResult.new()
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["body"] = body
    ret["signature"] = signature
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret