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
class_name Gs2ExperienceCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var rank_cap_script_id = null
var change_experience_script = null
var change_rank_script = null
var change_rank_cap_script = null
var overflow_experience_script = null
var log_setting = null


func with_name(v) -> Gs2ExperienceCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2ExperienceCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2ExperienceCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2ExperienceCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_rank_cap_script_id(v) -> Gs2ExperienceCreateNamespaceRequest:
    rank_cap_script_id = v
    return self


func with_change_experience_script(v) -> Gs2ExperienceCreateNamespaceRequest:
    change_experience_script = v
    return self


func with_change_rank_script(v) -> Gs2ExperienceCreateNamespaceRequest:
    change_rank_script = v
    return self


func with_change_rank_cap_script(v) -> Gs2ExperienceCreateNamespaceRequest:
    change_rank_cap_script = v
    return self


func with_overflow_experience_script(v) -> Gs2ExperienceCreateNamespaceRequest:
    overflow_experience_script = v
    return self


func with_log_setting(v) -> Gs2ExperienceCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2ExperienceCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2ExperienceCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2ExperienceTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2ExperienceTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.rank_cap_script_id = null if data.get("rankCapScriptId") == null else str(data.get("rankCapScriptId"))
    ret.change_experience_script = null if data.get("changeExperienceScript") == null else Gs2ExperienceScriptSetting.from_dict(data.get("changeExperienceScript"))
    ret.change_rank_script = null if data.get("changeRankScript") == null else Gs2ExperienceScriptSetting.from_dict(data.get("changeRankScript"))
    ret.change_rank_cap_script = null if data.get("changeRankCapScript") == null else Gs2ExperienceScriptSetting.from_dict(data.get("changeRankCapScript"))
    ret.overflow_experience_script = null if data.get("overflowExperienceScript") == null else str(data.get("overflowExperienceScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2ExperienceLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["rankCapScriptId"] = rank_cap_script_id
    ret["changeExperienceScript"] = null if change_experience_script == null else change_experience_script.to_dict()
    ret["changeRankScript"] = null if change_rank_script == null else change_rank_script.to_dict()
    ret["changeRankCapScript"] = null if change_rank_cap_script == null else change_rank_cap_script.to_dict()
    ret["overflowExperienceScript"] = overflow_experience_script
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret