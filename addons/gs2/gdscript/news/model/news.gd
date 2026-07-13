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
class_name Gs2NewsNews
extends RefCounted


var section = null
var content = null
var title = null
var schedule_event_id = null
var timestamp = null
var front_matter = null


func with_section(v) -> Gs2NewsNews:
    section = v
    return self


func with_content(v) -> Gs2NewsNews:
    content = v
    return self


func with_title(v) -> Gs2NewsNews:
    title = v
    return self


func with_schedule_event_id(v) -> Gs2NewsNews:
    schedule_event_id = v
    return self


func with_timestamp(v) -> Gs2NewsNews:
    timestamp = v
    return self


func with_front_matter(v) -> Gs2NewsNews:
    front_matter = v
    return self


static func from_dict(data) -> Gs2NewsNews:
    if data == null:
        return null
    var ret = Gs2NewsNews.new()
    ret.section = null if data.get("section") == null else str(data.get("section"))
    ret.content = null if data.get("content") == null else str(data.get("content"))
    ret.title = null if data.get("title") == null else str(data.get("title"))
    ret.schedule_event_id = null if data.get("scheduleEventId") == null else str(data.get("scheduleEventId"))
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.front_matter = null if data.get("frontMatter") == null else str(data.get("frontMatter"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["section"] = section
    ret["content"] = content
    ret["title"] = title
    ret["scheduleEventId"] = schedule_event_id
    ret["timestamp"] = timestamp
    ret["frontMatter"] = front_matter
    return ret