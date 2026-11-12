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

class_name Gs2Domain
extends Gs2DomainCore

var account: Gs2Account
var ad_reward: Gs2AdReward
var auth: Gs2Auth
var buff: Gs2Buff
var chat: Gs2Chat
var datastore: Gs2Datastore
var deploy: Gs2Deploy
var dictionary: Gs2Dictionary
var distributor: Gs2Distributor
var enchant: Gs2Enchant
var enhance: Gs2Enhance
var exchange: Gs2Exchange
var experience: Gs2Experience
var formation: Gs2Formation
var freeze: Gs2Freeze
var friend: Gs2Friend
var gateway: Gs2Gateway
var grade: Gs2Grade
var guard: Gs2Guard
var guild: Gs2Guild
var identifier: Gs2Identifier
var idle: Gs2Idle
var inbox: Gs2Inbox
var inventory: Gs2Inventory
var job_queue: Gs2JobQueue
var key: Gs2Key
var limit: Gs2Limit
var lock: Gs2Lock
var log: Gs2Log
var login_reward: Gs2LoginReward
var lottery: Gs2Lottery
var matchmaking: Gs2Matchmaking
var mega_field: Gs2MegaField
var mission: Gs2Mission
var money: Gs2Money
var money2: Gs2Money2
var news: Gs2News
var quest: Gs2Quest
var ranking: Gs2Ranking
var ranking2: Gs2Ranking2
var realtime: Gs2Realtime
var schedule: Gs2Schedule
var script_: Gs2Script
var season_rating: Gs2SeasonRating
var serial_key: Gs2SerialKey
var showcase: Gs2Showcase
var skill_tree: Gs2SkillTree
var stamina: Gs2Stamina
var state_machine: Gs2StateMachine
var version: Gs2Version


func _init(
    session: Gs2RestSession,
    wssession: Gs2WebSocketSession = null,
    distributor_namespace_name = null
):
    super(session, wssession, distributor_namespace_name)
    account = service_domain("Gs2Account")
    ad_reward = service_domain("Gs2AdReward")
    auth = service_domain("Gs2Auth")
    buff = service_domain("Gs2Buff")
    chat = service_domain("Gs2Chat")
    datastore = service_domain("Gs2Datastore")
    deploy = service_domain("Gs2Deploy")
    dictionary = service_domain("Gs2Dictionary")
    distributor = service_domain("Gs2Distributor")
    enchant = service_domain("Gs2Enchant")
    enhance = service_domain("Gs2Enhance")
    exchange = service_domain("Gs2Exchange")
    experience = service_domain("Gs2Experience")
    formation = service_domain("Gs2Formation")
    freeze = service_domain("Gs2Freeze")
    friend = service_domain("Gs2Friend")
    gateway = service_domain("Gs2Gateway")
    grade = service_domain("Gs2Grade")
    guard = service_domain("Gs2Guard")
    guild = service_domain("Gs2Guild")
    identifier = service_domain("Gs2Identifier")
    idle = service_domain("Gs2Idle")
    inbox = service_domain("Gs2Inbox")
    inventory = service_domain("Gs2Inventory")
    job_queue = service_domain("Gs2JobQueue")
    key = service_domain("Gs2Key")
    limit = service_domain("Gs2Limit")
    lock = service_domain("Gs2Lock")
    log = service_domain("Gs2Log")
    login_reward = service_domain("Gs2LoginReward")
    lottery = service_domain("Gs2Lottery")
    matchmaking = service_domain("Gs2Matchmaking")
    mega_field = service_domain("Gs2MegaField")
    mission = service_domain("Gs2Mission")
    money = service_domain("Gs2Money")
    money2 = service_domain("Gs2Money2")
    news = service_domain("Gs2News")
    quest = service_domain("Gs2Quest")
    ranking = service_domain("Gs2Ranking")
    ranking2 = service_domain("Gs2Ranking2")
    realtime = service_domain("Gs2Realtime")
    schedule = service_domain("Gs2Schedule")
    script_ = service_domain("Gs2Script")
    season_rating = service_domain("Gs2SeasonRating")
    serial_key = service_domain("Gs2SerialKey")
    showcase = service_domain("Gs2Showcase")
    skill_tree = service_domain("Gs2SkillTree")
    stamina = service_domain("Gs2Stamina")
    state_machine = service_domain("Gs2StateMachine")
    version = service_domain("Gs2Version")
