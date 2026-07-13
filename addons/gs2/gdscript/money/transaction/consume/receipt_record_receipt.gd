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
class_name Gs2MoneyReceiptRecordReceiptExecutable
extends RefCounted


static func is_executable(
    item,
    request: Gs2MoneyRecordReceiptRequest
) -> bool:
    return true


static func speculative_execution(
    item,
    request: Gs2MoneyRecordReceiptRequest
):
    push_warning("Speculative execution not supported on this action: Gs2Money:RecordReceipt")
    return item.get_script().from_dict(item.to_dict())


static func rate(
    request: Gs2MoneyRecordReceiptRequest,
    rate_value
) -> Gs2MoneyRecordReceiptRequest:
    push_error("not supported rate action Gs2Money:RecordReceipt")
    return request