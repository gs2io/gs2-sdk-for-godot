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
class_name Gs2AccountAccountDeletionSetting
extends RefCounted


var grace_period_minutes = null
var login_during_grace_period = null
var clean_user_data_scope = null


func with_grace_period_minutes(v) -> Gs2AccountAccountDeletionSetting:
    grace_period_minutes = v
    return self


func with_login_during_grace_period(v) -> Gs2AccountAccountDeletionSetting:
    login_during_grace_period = v
    return self


func with_clean_user_data_scope(v) -> Gs2AccountAccountDeletionSetting:
    clean_user_data_scope = v
    return self


static func from_dict(data) -> Gs2AccountAccountDeletionSetting:
    if data == null:
        return null
    var ret = Gs2AccountAccountDeletionSetting.new()
    ret.grace_period_minutes = null if data.get("gracePeriodMinutes") == null else int(data.get("gracePeriodMinutes"))
    ret.login_during_grace_period = null if data.get("loginDuringGracePeriod") == null else str(data.get("loginDuringGracePeriod"))
    ret.clean_user_data_scope = null if data.get("cleanUserDataScope") == null else str(data.get("cleanUserDataScope"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gracePeriodMinutes"] = grace_period_minutes
    ret["loginDuringGracePeriod"] = login_during_grace_period
    ret["cleanUserDataScope"] = clean_user_data_scope
    return ret