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
class_name Gs2ProjectDescribeImportErrorLogsRequest
extends Gs2Request


var transaction_id = null
var page_token = null
var limit = null


func with_transaction_id(v) -> Gs2ProjectDescribeImportErrorLogsRequest:
    transaction_id = v
    return self


func with_page_token(v) -> Gs2ProjectDescribeImportErrorLogsRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2ProjectDescribeImportErrorLogsRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2ProjectDescribeImportErrorLogsRequest:
    if data == null:
        return null
    var ret = Gs2ProjectDescribeImportErrorLogsRequest.new()
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["transactionId"] = transaction_id
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret