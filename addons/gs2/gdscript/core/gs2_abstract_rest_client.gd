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
class_name Gs2AbstractRestClient
extends RefCounted


var session: Gs2RestSession


func _init(session_: Gs2RestSession):
    session = session_


func create_authorized_headers() -> Dictionary:
    var headers = {}
    if session.credential.client_id != null:
        headers["X-GS2-CLIENT-ID"] = session.credential.client_id
    if session.credential.project_token != null:
        headers["Authorization"] = "Bearer " + session.credential.project_token
    return headers
