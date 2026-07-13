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
class_name Gs2Money2FakeSetting
extends RefCounted


var accept_fake_receipt = null


func with_accept_fake_receipt(v) -> Gs2Money2FakeSetting:
    accept_fake_receipt = v
    return self


static func from_dict(data) -> Gs2Money2FakeSetting:
    if data == null:
        return null
    var ret = Gs2Money2FakeSetting.new()
    ret.accept_fake_receipt = null if data.get("acceptFakeReceipt") == null else str(data.get("acceptFakeReceipt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["acceptFakeReceipt"] = accept_fake_receipt
    return ret