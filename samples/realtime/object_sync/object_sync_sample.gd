# GS2-Realtime object synchronization sample (not part of the addon).
#
# ObjectSync (Unity's ObjectSyncSample): each member's player (prefab 1) moves with WASD / the
# arrow keys and sends an RPC that enlarges it on every client. The room's rules
# (rules/object_sync_room.gd) own the rest: a box (2) a member leases for 6 seconds to move it,
# a door (3) members open and close (it closes itself after 8 seconds), and an enemy (4) whose
# health members reduce (it comes back 8 seconds after it is defeated). The door's angle comes
# from its Gs2NetworkTransform3D and the enemy's health bar from a property binding; the
# generated DoorAction / EnemyAction name the interactions.
extends "res://samples/realtime/shared/realtime_sync_sample.gd"


const SamplePulse = preload("res://samples/realtime/object_sync/sample_pulse.gd")

const PLAYER_PREFAB = 1
const BOX_PREFAB = 2

## This client's player, and the room's shared objects (null until the room has them).
var own: Gs2NetworkEntity = null
var box: Gs2SharedObject = null
var door: Gs2SharedObject = null
var enemy: Gs2SharedObject = null

var _spawned := false


func _add_actions() -> void:
    add_action("Move +X", move_right)
    add_action("Send RPC", send_rpc_pulse)
    add_action("Acquire box (6s)", acquire_box)
    add_action("Renew box", renew_box)
    add_action("Move box +X", move_box)
    add_action("Release box", release_box)
    add_action("Hit enemy (-25 HP)", hit_enemy)
    add_action("Open door", open_door)
    add_action("Close door", close_door)


# Like PhotonNetwork.Instantiate: the instance can move at once; its transform fills the spawn.
func _on_room_ready() -> void:
    if _spawned and own != null:
        return
    var entity := world.instantiate(PLAYER_PREFAB, spawn_position())
    if entity == null:
        request_text = "Spawn: " + world.last_error
        return
    _spawned = true
    own = entity


func _on_spawned(entity: Gs2NetworkEntity) -> void:
    if entity.is_prefab(PLAYER_PREFAB) and entity.is_mine():
        own = entity
    elif entity.is_prefab(BOX_PREFAB):
        box = _shared(entity)
    elif entity.is_prefab(DoorStateSchema.PREFAB):
        door = _shared(entity)
    elif entity.is_prefab(EnemyStateSchema.PREFAB):
        enemy = _shared(entity)


func _on_despawned(entity: Gs2NetworkEntity) -> void:
    if entity == own:
        own = null
        _spawned = false


func _on_room_cleared() -> void:
    own = null
    box = null
    door = null
    enemy = null
    _spawned = false


func _describe(o: Gs2NetworkObject) -> String:
    if DoorStateSchema.is_of(o):
        return " door=" + ("open" if DoorStateSchema.is_open(o) else "closed")
    if EnemyStateSchema.is_of(o):
        return " hp=%d" % roundi(EnemyStateSchema.health(o) * 100)
    return ""


func _status() -> String:
    var pulse := _pulse()
    return "own object %d / RPC received %d" % [own.network_object.id if own != null and own.network_object != null else 0, pulse.received if pulse != null else 0]


static func _shared(entity: Gs2NetworkEntity) -> Gs2SharedObject:
    for node in entity.scope_nodes():
        if node is Gs2SharedObject:
            return node
    return null


## A free cell of an 8 x 8 grid (in the room's centimetres), so members do not overlap.
func spawn_position() -> Vector3:
    for slot in 64:
        var x := (slot % 8) * 150 - 525
        @warning_ignore("integer_division")
        var z := (slot / 8) * 130 - 455
        var occupied := false
        for o in world.client.objects():
            var values := o.get_values()
            if absi(values[0] - x) < 100 and absi(values[2] - z) < 100:
                occupied = true
                break
        if not occupied:
            return Vector3(x, 50, z) * 0.01
    return Vector3(0, 0.5, 0)


# ---- The buttons ----

func move_right() -> void:
    if own != null and room_ready():
        (own.get_parent() as Node3D).position += Vector3.RIGHT


func send_rpc_pulse() -> void:
    if own != null and room_ready() and not own.send_rpc("pulse", Gs2SyncTypes.RpcTarget.ALL, 1.5):
        request_text = "RPC: " + own.last_error


func acquire_box() -> void:
    if box != null and room_ready():
        track(box.acquire(), "Acquire box")


func renew_box() -> void:
    if box != null and room_ready():
        track(box.renew(), "Renew box")


func release_box() -> void:
    if box != null and room_ready():
        track(box.release(), "Release box")


func move_box() -> void:
    if box == null or not room_ready():
        return
    if box.can_write():
        (box.get_parent() as Node3D).position += Vector3.RIGHT
    else:
        request_text = "Acquire the box first"


func open_door() -> void:
    if door != null and room_ready():
        track(door.interact(DoorAction.OPEN), "Open door")


func close_door() -> void:
    if door != null and room_ready():
        track(door.interact(DoorAction.CLOSE), "Close door")


func hit_enemy() -> void:
    if enemy != null and room_ready():
        track(enemy.interact(EnemyAction.ATTACK), "Hit enemy")


func _pulse() -> SamplePulse:
    if own == null:
        return null
    return own.get_parent().get_node_or_null("Pulse") as SamplePulse
