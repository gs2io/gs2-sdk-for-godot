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
class_name Gs2Money2VerifyReceiptRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var content_name = null
var receipt = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2Money2VerifyReceiptRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2Money2VerifyReceiptRequest:
    access_token = v
    return self


func with_content_name(v) -> Gs2Money2VerifyReceiptRequest:
    content_name = v
    return self


func with_receipt(v) -> Gs2Money2VerifyReceiptRequest:
    receipt = v
    return self


func with_duplication_avoider(v) -> Gs2Money2VerifyReceiptRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2Money2VerifyReceiptRequest:
    if data == null:
        return null
    var ret = Gs2Money2VerifyReceiptRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.receipt = null if data.get("receipt") == null else Gs2Money2Receipt.from_dict(data.get("receipt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["contentName"] = content_name
    ret["receipt"] = null if receipt == null else receipt.to_dict()
    return ret