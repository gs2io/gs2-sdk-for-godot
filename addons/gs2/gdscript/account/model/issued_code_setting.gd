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
class_name Gs2AccountIssuedCodeSetting
extends RefCounted


var expires_days = null
var max_failed_attempts = null
var delete_on_use = null


func with_expires_days(v) -> Gs2AccountIssuedCodeSetting:
    expires_days = v
    return self


func with_max_failed_attempts(v) -> Gs2AccountIssuedCodeSetting:
    max_failed_attempts = v
    return self


func with_delete_on_use(v) -> Gs2AccountIssuedCodeSetting:
    delete_on_use = v
    return self


static func from_dict(data) -> Gs2AccountIssuedCodeSetting:
    if data == null:
        return null
    var ret = Gs2AccountIssuedCodeSetting.new()
    ret.expires_days = null if data.get("expiresDays") == null else int(data.get("expiresDays"))
    ret.max_failed_attempts = null if data.get("maxFailedAttempts") == null else int(data.get("maxFailedAttempts"))
    ret.delete_on_use = null if data.get("deleteOnUse") == null else bool(data.get("deleteOnUse"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["expiresDays"] = expires_days
    ret["maxFailedAttempts"] = max_failed_attempts
    ret["deleteOnUse"] = delete_on_use
    return ret