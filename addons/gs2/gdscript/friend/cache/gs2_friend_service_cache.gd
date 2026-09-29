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
class_name Gs2FriendServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    if kind == "followUser":
        var item = Gs2FriendFollowUser.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FriendFollowUserCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "friendUser":
        var item = Gs2FriendFriendUser.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FriendFriendUserCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "profile":
        var item = Gs2FriendProfile.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FriendProfileCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "receiveFriendRequest":
        var item = Gs2FriendReceiveFriendRequest.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FriendReceiveFriendRequestCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "sendFriendRequest":
        var item = Gs2FriendSendFriendRequest.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2FriendSendFriendRequestCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "followUser":
        cache.set_list_cached("Gs2FriendFollowUser", parent_key)
        return true
    if kind == "friendUser":
        cache.set_list_cached("Gs2FriendFriendUser", parent_key)
        return true
    if kind == "profile":
        cache.set_list_cached("Gs2FriendProfile", parent_key)
        return true
    if kind == "receiveFriendRequest":
        cache.set_list_cached("Gs2FriendReceiveFriendRequest", parent_key)
        return true
    if kind == "sendFriendRequest":
        cache.set_list_cached("Gs2FriendSendFriendRequest", parent_key)
        return true
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2FriendDescribeNamespacesMethodCache.put_cache(
            Gs2FriendDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2FriendCreateNamespaceMethodCache.put_cache(
            Gs2FriendCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2FriendGetNamespaceStatusMethodCache.put_cache(
            Gs2FriendGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2FriendGetNamespaceMethodCache.put_cache(
            Gs2FriendGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2FriendUpdateNamespaceMethodCache.put_cache(
            Gs2FriendUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2FriendDeleteNamespaceMethodCache.put_cache(
            Gs2FriendDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2FriendGetServiceVersionMethodCache.put_cache(
            Gs2FriendGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2FriendDumpUserDataByUserIdMethodCache.put_cache(
            Gs2FriendDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2FriendCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2FriendCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2FriendCleanUserDataByUserIdMethodCache.put_cache(
            Gs2FriendCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2FriendCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2FriendCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2FriendPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2FriendPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2FriendImportUserDataByUserIdMethodCache.put_cache(
            Gs2FriendImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2FriendCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2FriendCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProfile":
        Gs2FriendGetProfileMethodCache.put_cache(
            Gs2FriendGetProfileResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetProfileRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProfileByUserId":
        Gs2FriendGetProfileByUserIdMethodCache.put_cache(
            Gs2FriendGetProfileByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetProfileByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateProfile":
        Gs2FriendUpdateProfileMethodCache.put_cache(
            Gs2FriendUpdateProfileResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUpdateProfileRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateProfileByUserId":
        Gs2FriendUpdateProfileByUserIdMethodCache.put_cache(
            Gs2FriendUpdateProfileByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUpdateProfileByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProfileByUserId":
        Gs2FriendDeleteProfileByUserIdMethodCache.put_cache(
            Gs2FriendDeleteProfileByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteProfileByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFriends":
        Gs2FriendDescribeFriendsMethodCache.put_cache(
            Gs2FriendDescribeFriendsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeFriendsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFriendsByUserId":
        Gs2FriendDescribeFriendsByUserIdMethodCache.put_cache(
            Gs2FriendDescribeFriendsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeFriendsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBlackList":
        Gs2FriendDescribeBlackListMethodCache.put_cache(
            Gs2FriendDescribeBlackListResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeBlackListRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBlackListByUserId":
        Gs2FriendDescribeBlackListByUserIdMethodCache.put_cache(
            Gs2FriendDescribeBlackListByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeBlackListByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "registerBlackList":
        Gs2FriendRegisterBlackListMethodCache.put_cache(
            Gs2FriendRegisterBlackListResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendRegisterBlackListRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "registerBlackListByUserId":
        Gs2FriendRegisterBlackListByUserIdMethodCache.put_cache(
            Gs2FriendRegisterBlackListByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendRegisterBlackListByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unregisterBlackList":
        Gs2FriendUnregisterBlackListMethodCache.put_cache(
            Gs2FriendUnregisterBlackListResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUnregisterBlackListRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unregisterBlackListByUserId":
        Gs2FriendUnregisterBlackListByUserIdMethodCache.put_cache(
            Gs2FriendUnregisterBlackListByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUnregisterBlackListByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFollows":
        Gs2FriendDescribeFollowsMethodCache.put_cache(
            Gs2FriendDescribeFollowsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeFollowsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFollowsByUserId":
        Gs2FriendDescribeFollowsByUserIdMethodCache.put_cache(
            Gs2FriendDescribeFollowsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeFollowsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFollow":
        Gs2FriendGetFollowMethodCache.put_cache(
            Gs2FriendGetFollowResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetFollowRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFollowByUserId":
        Gs2FriendGetFollowByUserIdMethodCache.put_cache(
            Gs2FriendGetFollowByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetFollowByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "follow":
        Gs2FriendFollowMethodCache.put_cache(
            Gs2FriendFollowResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendFollowRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "followByUserId":
        Gs2FriendFollowByUserIdMethodCache.put_cache(
            Gs2FriendFollowByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendFollowByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unfollow":
        Gs2FriendUnfollowMethodCache.put_cache(
            Gs2FriendUnfollowResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUnfollowRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unfollowByUserId":
        Gs2FriendUnfollowByUserIdMethodCache.put_cache(
            Gs2FriendUnfollowByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendUnfollowByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFriend":
        Gs2FriendGetFriendMethodCache.put_cache(
            Gs2FriendGetFriendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetFriendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFriendByUserId":
        Gs2FriendGetFriendByUserIdMethodCache.put_cache(
            Gs2FriendGetFriendByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetFriendByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addFriend":
        Gs2FriendAddFriendMethodCache.put_cache(
            Gs2FriendAddFriendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendAddFriendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addFriendByUserId":
        Gs2FriendAddFriendByUserIdMethodCache.put_cache(
            Gs2FriendAddFriendByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendAddFriendByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFriend":
        Gs2FriendDeleteFriendMethodCache.put_cache(
            Gs2FriendDeleteFriendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteFriendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFriendByUserId":
        Gs2FriendDeleteFriendByUserIdMethodCache.put_cache(
            Gs2FriendDeleteFriendByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteFriendByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSendRequests":
        Gs2FriendDescribeSendRequestsMethodCache.put_cache(
            Gs2FriendDescribeSendRequestsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeSendRequestsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSendRequestsByUserId":
        Gs2FriendDescribeSendRequestsByUserIdMethodCache.put_cache(
            Gs2FriendDescribeSendRequestsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeSendRequestsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSendRequest":
        Gs2FriendGetSendRequestMethodCache.put_cache(
            Gs2FriendGetSendRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetSendRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSendRequestByUserId":
        Gs2FriendGetSendRequestByUserIdMethodCache.put_cache(
            Gs2FriendGetSendRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetSendRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendRequest":
        Gs2FriendSendRequestMethodCache.put_cache(
            Gs2FriendSendRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendSendRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendRequestByUserId":
        Gs2FriendSendRequestByUserIdMethodCache.put_cache(
            Gs2FriendSendRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendSendRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRequest":
        Gs2FriendDeleteRequestMethodCache.put_cache(
            Gs2FriendDeleteRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRequestByUserId":
        Gs2FriendDeleteRequestByUserIdMethodCache.put_cache(
            Gs2FriendDeleteRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDeleteRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveRequests":
        Gs2FriendDescribeReceiveRequestsMethodCache.put_cache(
            Gs2FriendDescribeReceiveRequestsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeReceiveRequestsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveRequestsByUserId":
        Gs2FriendDescribeReceiveRequestsByUserIdMethodCache.put_cache(
            Gs2FriendDescribeReceiveRequestsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendDescribeReceiveRequestsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveRequest":
        Gs2FriendGetReceiveRequestMethodCache.put_cache(
            Gs2FriendGetReceiveRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetReceiveRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveRequestByUserId":
        Gs2FriendGetReceiveRequestByUserIdMethodCache.put_cache(
            Gs2FriendGetReceiveRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetReceiveRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acceptRequest":
        Gs2FriendAcceptRequestMethodCache.put_cache(
            Gs2FriendAcceptRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendAcceptRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acceptRequestByUserId":
        Gs2FriendAcceptRequestByUserIdMethodCache.put_cache(
            Gs2FriendAcceptRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendAcceptRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rejectRequest":
        Gs2FriendRejectRequestMethodCache.put_cache(
            Gs2FriendRejectRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendRejectRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rejectRequestByUserId":
        Gs2FriendRejectRequestByUserIdMethodCache.put_cache(
            Gs2FriendRejectRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendRejectRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPublicProfile":
        Gs2FriendGetPublicProfileMethodCache.put_cache(
            Gs2FriendGetPublicProfileResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2FriendGetPublicProfileRequest.from_dict(_parse(request_payload))
        )
        return
    pass