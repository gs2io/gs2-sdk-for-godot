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
class_name Gs2Ranking2EzListClusterRankingReceivedRewardsResult
extends RefCounted


var items = []
var next_page_token = null


static func from_model(model) -> Gs2Ranking2EzListClusterRankingReceivedRewardsResult:
    var ret = Gs2Ranking2EzListClusterRankingReceivedRewardsResult.new()
    ret.items = [] if model.items == null else model.items.map(func(v): return Gs2Ranking2EzClusterRankingReceivedReward.from_model(v))
    ret.next_page_token = model.next_page_token
    return ret