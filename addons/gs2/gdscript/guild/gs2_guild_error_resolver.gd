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
class_name Gs2GuildErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "CreateGuild", "CreateGuildByUserId":
            if error.has_error_code("user.joinedGuild.tooMany"):
                return Gs2GuildMaximumJoinedGuildsReachedException.new(error)
        "DeleteMember", "DeleteMemberByGuildName", "Withdrawal", "WithdrawalByUserId":
            if error.has_error_code("guild.member.master.require"):
                return Gs2GuildGuildMasterRequiredException.new(error)
        "Assume", "AssumeByUserId":
            if error.has_error_code("guild.member.notFound"):
                return Gs2GuildNotIncludedGuildMemberException.new(error)
        "AcceptRequest", "AcceptRequestByGuildName":
            if error.has_error_code("user.joinedGuild.tooMany"):
                return Gs2GuildMaximumJoinedGuildsReachedException.new(error)
            elif error.has_error_code("guild.members.tooMany"):
                return Gs2GuildMaximumMembersReachedException.new(error)
        "SendRequest", "SendRequestByUserId":
            if error.has_error_code("guild.members.tooMany"):
                return Gs2GuildMaximumMembersReachedException.new(error)
            elif error.has_error_code("user.joinedGuild.tooMany"):
                return Gs2GuildMaximumJoinedGuildsReachedException.new(error)
            elif error.has_error_code("guild.receiveRequests.tooMany"):
                return Gs2GuildMaximumReceiveRequestsReachedException.new(error)
            elif error.has_error_code("guild.sendRequests.tooMany"):
                return Gs2GuildMaximumSendRequestsReachedException.new(error)
            elif error.has_error_code("guild.sendRequests.notMeetJoinRequirements"):
                return Gs2GuildDotMeetJoinRequirementsException.new(error)
    return error