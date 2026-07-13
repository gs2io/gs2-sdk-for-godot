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
class_name Gs2DatastoreEzUserDomain
extends RefCounted


var _domain: Gs2DatastoreUserDomain
var _connection: Gs2Connection
var upload_url: Variant:
    get:
        return _domain.upload_url
var file_url: Variant:
    get:
        return _domain.file_url
var content_length: Variant:
    get:
        return _domain.content_length
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2DatastoreUserDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func data_object(
    data_object_name
) -> Gs2DatastoreEzDataObjectDomain:
    return Gs2DatastoreEzDataObjectDomain.new(
        _domain.data_object(
            data_object_name
        ),
        _connection
    )