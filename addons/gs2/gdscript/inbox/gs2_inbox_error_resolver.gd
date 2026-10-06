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
class_name Gs2InboxErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "OpenMessage", "OpenMessageByUserId", "ReadMessage", "ReadMessageByUserId", "BatchReadMessages", "BatchReadMessagesByUserId":
            if error.has_error_code("inbox.message.expired"):
                return Gs2InboxMessageExpiredException.new(error)
            elif error.has_error_code("inbox.message.alreadyRead"):
                return Gs2InboxMessageAlreadyReadException.new(error)
    return error