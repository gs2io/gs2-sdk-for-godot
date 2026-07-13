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
class_name Gs2ProjectIssuePasswordResult
extends RefCounted


var new_password = null
var metadata = null


func with_new_password(v) -> Gs2ProjectIssuePasswordResult:
    new_password = v
    return self


func with_metadata(v) -> Gs2ProjectIssuePasswordResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2ProjectIssuePasswordResult:
    if data == null:
        return null
    var ret = Gs2ProjectIssuePasswordResult.new()
    ret.new_password = null if data.get("newPassword") == null else str(data.get("newPassword"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["newPassword"] = new_password
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret