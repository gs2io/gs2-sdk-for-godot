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

## class_name (フラット命名) からスクリプトを動的に解決するユーティリティ。
## C# 版の Core/Domain/Gs2.cs にある巨大な service switch の代替。
class_name Gs2ClassRegistry
extends RefCounted


static var _class_paths: Variant = null


static func resolve(type_name: String):
    if _class_paths == null:
        _class_paths = {}
        for entry in ProjectSettings.get_global_class_list():
            _class_paths[entry["class"]] = entry["path"]
    if not _class_paths.has(type_name):
        return null
    return load(_class_paths[type_name])
