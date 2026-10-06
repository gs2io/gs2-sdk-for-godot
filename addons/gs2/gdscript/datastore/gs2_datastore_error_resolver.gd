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
class_name Gs2DatastoreErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "DoneUpload", "DoneUploadByUserId":
            if error.has_error_code("dataObject.status.invalid"):
                return Gs2DatastoreInvalidStatusException.new(error)
            elif error.has_error_code("dataObject.file.notUploaded"):
                return Gs2DatastoreNotUploadedException.new(error)
        "DeleteDataObject", "DeleteDataObjectByUserId", "RestoreDataObject":
            if error.has_error_code("dataObject.status.invalid"):
                return Gs2DatastoreInvalidStatusException.new(error)
    return error