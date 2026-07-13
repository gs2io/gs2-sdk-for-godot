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
class_name Gs2Request
extends RefCounted


var context_stack: Variant = null
var request_id: Variant = null
var dry_run: bool = false


func with_context_stack(v) -> Gs2Request:
    context_stack = v
    return self


func with_request_id(v) -> Gs2Request:
    request_id = v
    return self


func with_dry_run(v) -> Gs2Request:
    dry_run = v
    return self
