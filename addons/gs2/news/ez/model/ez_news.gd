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
class_name Gs2NewsEzNews
extends RefCounted


var section = null
var content = null
var title = null
var schedule_event_id = null
var timestamp = 0
var front_matter = null


func with_section(v) -> Gs2NewsEzNews:
    section = v
    return self


func with_content(v) -> Gs2NewsEzNews:
    content = v
    return self


func with_title(v) -> Gs2NewsEzNews:
    title = v
    return self


func with_schedule_event_id(v) -> Gs2NewsEzNews:
    schedule_event_id = v
    return self


func with_timestamp(v) -> Gs2NewsEzNews:
    timestamp = v
    return self


func with_front_matter(v) -> Gs2NewsEzNews:
    front_matter = v
    return self


func to_model() -> Gs2NewsNews:
    var ret = Gs2NewsNews.new()
    ret.section = section
    ret.content = content
    ret.title = title
    ret.schedule_event_id = schedule_event_id
    ret.timestamp = timestamp
    ret.front_matter = front_matter
    return ret


static func from_model(model) -> Gs2NewsEzNews:
    var ret = Gs2NewsEzNews.new()
    ret.section = model.section
    ret.content = model.content
    ret.title = model.title
    ret.schedule_event_id = model.schedule_event_id
    ret.timestamp = 0 if model.timestamp == null else model.timestamp
    ret.front_matter = model.front_matter
    return ret