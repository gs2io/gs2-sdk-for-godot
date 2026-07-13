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
class_name Gs2Money2VerifyReceiptEvent
extends RefCounted


var content_name = null
var platform = null
var apple_app_store_verify_receipt_event = null
var google_play_verify_receipt_event = null


func with_content_name(v) -> Gs2Money2VerifyReceiptEvent:
    content_name = v
    return self


func with_platform(v) -> Gs2Money2VerifyReceiptEvent:
    platform = v
    return self


func with_apple_app_store_verify_receipt_event(v) -> Gs2Money2VerifyReceiptEvent:
    apple_app_store_verify_receipt_event = v
    return self


func with_google_play_verify_receipt_event(v) -> Gs2Money2VerifyReceiptEvent:
    google_play_verify_receipt_event = v
    return self


static func from_dict(data) -> Gs2Money2VerifyReceiptEvent:
    if data == null:
        return null
    var ret = Gs2Money2VerifyReceiptEvent.new()
    ret.content_name = null if data.get("contentName") == null else str(data.get("contentName"))
    ret.platform = null if data.get("platform") == null else str(data.get("platform"))
    ret.apple_app_store_verify_receipt_event = null if data.get("appleAppStoreVerifyReceiptEvent") == null else Gs2Money2AppleAppStoreVerifyReceiptEvent.from_dict(data.get("appleAppStoreVerifyReceiptEvent"))
    ret.google_play_verify_receipt_event = null if data.get("googlePlayVerifyReceiptEvent") == null else Gs2Money2GooglePlayVerifyReceiptEvent.from_dict(data.get("googlePlayVerifyReceiptEvent"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["contentName"] = content_name
    ret["platform"] = platform
    ret["appleAppStoreVerifyReceiptEvent"] = null if apple_app_store_verify_receipt_event == null else apple_app_store_verify_receipt_event.to_dict()
    ret["googlePlayVerifyReceiptEvent"] = null if google_play_verify_receipt_event == null else google_play_verify_receipt_event.to_dict()
    return ret