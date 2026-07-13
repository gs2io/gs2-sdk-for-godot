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
class_name Gs2ProjectDescribeBillingsRequest
extends Gs2Request


var account_token = null
var project_name = null
var year = null
var month = null
var region = null
var service = null


func with_account_token(v) -> Gs2ProjectDescribeBillingsRequest:
    account_token = v
    return self


func with_project_name(v) -> Gs2ProjectDescribeBillingsRequest:
    project_name = v
    return self


func with_year(v) -> Gs2ProjectDescribeBillingsRequest:
    year = v
    return self


func with_month(v) -> Gs2ProjectDescribeBillingsRequest:
    month = v
    return self


func with_region(v) -> Gs2ProjectDescribeBillingsRequest:
    region = v
    return self


func with_service(v) -> Gs2ProjectDescribeBillingsRequest:
    service = v
    return self


static func from_dict(data) -> Gs2ProjectDescribeBillingsRequest:
    if data == null:
        return null
    var ret = Gs2ProjectDescribeBillingsRequest.new()
    ret.account_token = null if data.get("accountToken") == null else str(data.get("accountToken"))
    ret.project_name = null if data.get("projectName") == null else str(data.get("projectName"))
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.region = null if data.get("region") == null else str(data.get("region"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["accountToken"] = account_token
    ret["projectName"] = project_name
    ret["year"] = year
    ret["month"] = month
    ret["region"] = region
    ret["service"] = service
    return ret