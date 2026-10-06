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
class_name Gs2ChatErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "CreateRoom", "UpdateRoom", "DeleteRoom":
            if error.has_error_code("room.allowUserIds.notInclude"):
                return Gs2ChatNoAccessPrivilegesException.new(error)
        "DescribeMessages", "DescribeMessagesByUserId", "DescribeLatestMessages", "DescribeLatestMessagesByUserId", "Post", "PostByUserId", "GetMessage", "GetMessageByUserId":
            if error.has_error_code("room.allowUserIds.notInclude"):
                return Gs2ChatNoAccessPrivilegesException.new(error)
            elif error.has_error_code("room.password.require"):
                return Gs2ChatPasswordRequiredException.new(error)
            elif error.has_error_code("room.password.invalid"):
                return Gs2ChatPasswordIncorrectException.new(error)
    return error