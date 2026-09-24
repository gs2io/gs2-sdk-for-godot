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
class_name Gs2ProjectGetBillingsRequest
extends Gs2Request


var year = null
var month = null
var service = null


func with_year(v) -> Gs2ProjectGetBillingsRequest:
    year = v
    return self


func with_month(v) -> Gs2ProjectGetBillingsRequest:
    month = v
    return self


func with_service(v) -> Gs2ProjectGetBillingsRequest:
    service = v
    return self


static func from_dict(data) -> Gs2ProjectGetBillingsRequest:
    if data == null:
        return null
    var ret = Gs2ProjectGetBillingsRequest.new()
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["year"] = year
    ret["month"] = month
    ret["service"] = service
    return ret