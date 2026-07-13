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
class_name Gs2DistributorDistributeWithoutOverflowProcessRequest
extends Gs2Request


var user_id = null
var distribute_resource = null
var time_offset_token = null
var duplication_avoider = null


func with_user_id(v) -> Gs2DistributorDistributeWithoutOverflowProcessRequest:
    user_id = v
    return self


func with_distribute_resource(v) -> Gs2DistributorDistributeWithoutOverflowProcessRequest:
    distribute_resource = v
    return self


func with_time_offset_token(v) -> Gs2DistributorDistributeWithoutOverflowProcessRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2DistributorDistributeWithoutOverflowProcessRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2DistributorDistributeWithoutOverflowProcessRequest:
    if data == null:
        return null
    var ret = Gs2DistributorDistributeWithoutOverflowProcessRequest.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.distribute_resource = null if data.get("distributeResource") == null else Gs2DistributorDistributeResource.from_dict(data.get("distributeResource"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["distributeResource"] = null if distribute_resource == null else distribute_resource.to_dict()
    ret["timeOffsetToken"] = time_offset_token
    return ret