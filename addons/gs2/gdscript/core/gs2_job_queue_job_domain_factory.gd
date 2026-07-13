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
class_name Gs2JobQueueJobDomainFactory
extends RefCounted


## PushByUserIdResult からジョブ実行待ちのトランザクションを構築する
static func to_transaction(gs2, access_token, user_id, result) -> Gs2TransactionDomain:
    var actions = []
    if result.auto_run != null and result.auto_run:
        for v in (result.items if result.items != null else []):
            actions.append(Gs2AutoJobQueueDomain.new(
                gs2,
                access_token,
                user_id,
                Gs2JobQueueJob.get_namespace_name_from_grn(v.job_id),
                Gs2JobQueueJob.get_job_name_from_grn(v.job_id)
            ))
    else:
        for v in (result.items if result.items != null else []):
            gs2.push_job_queue(Gs2JobQueueJob.get_namespace_name_from_grn(v.job_id))
            actions.append(Gs2ManualJobQueueDomain.new(
                gs2,
                access_token,
                user_id,
                Gs2JobQueueJob.get_namespace_name_from_grn(v.job_id),
                Gs2JobQueueJob.get_job_name_from_grn(v.job_id)
            ))
    return Gs2TransactionDomain.new(gs2, access_token, user_id, actions)
