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

## Gs2AutoStampSheetDomain のアクセストークン版コンストラクタ (C# 互換の別名クラス)
class_name Gs2AutoStampSheetAccessTokenDomain
extends Gs2AutoStampSheetDomain


func _init(gs2_, access_token_, transaction_id_):
    super._init(gs2_, access_token_, null, transaction_id_)
