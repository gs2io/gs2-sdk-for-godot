# Room rules of the ObjectSync sample (Unity's shared-room sample, SharedRoom.cs and
# SyncSchema.cs of the GS2-Realtime samples) in GDScript. Godot never runs this script: the GS2
# realtime authoring compiler turns it into the room's main.gsl and the classes in ../generated.
#
# The room spawns a box (prefab 2, leased for 6 seconds), a door (3) and an enemy (4).
# Members open / close the door and hit the enemy with Gs2SharedObject.interact; the door
# closes itself 8 seconds after it opens, and a defeated enemy comes back after 8 seconds.
# Players (prefab 1) are spawned by the members; the rules do not define them.
class_name ObjectSyncRoom
extends Gs2RoomRules

const STATE := RoomState
const RESULT := RoomResult
const ERROR := ObjectSyncError


class RoomState extends Gs2Record:
	var box_id: int
	var door_id: int
	var enemy_id: int


class RoomResult extends Gs2Record:
	var finished: bool


# C#'s enum is named Error, which GDScript's global Error enum takes; RoomError is
# taken by another rule set of the SDK's tests (generated classes are global).
enum ObjectSyncError { INVALID_OPERATION = 5, ALREADY_APPLIED = 6 }

# Wire slots stay stable when adding fields.
## @room_schema(3, standard=TRANSFORM)
enum DoorState {
	ROTATION_Y = 4,
	## @field(bool)
	IS_OPEN = 6,
}

## @room_schema(4, standard=TRANSFORM)
enum EnemyState {
	## @field(float, precision=0.01)
	HEALTH = 6,
}

# What members ask of the door and the enemy (Gs2SharedObject.interact(DoorAction.OPEN)).
## @room_action
enum DoorAction { OPEN = 1, CLOSE = 2 }

## @room_action
enum EnemyAction { ATTACK = 1 }

## @room_timer
enum RoomTimer { CLOSE_DOOR = 1, REVIVE_ENEMY = 2 }

const BOX_PREFAB = 2
const FULL_HEALTH = 100 # 1.0 in the field's units
const DAMAGE = 25


static func start() -> Gs2Step:
	# The Unity sample gives the box's lease in the namespace's object catalog; here the rules
	# define it, so the room needs no catalog for the shared objects.
	Gs2Room.define_leased_prefab_raw(BOX_PREFAB, Gs2RoomSync.TRANSFORM, 6000)
	Gs2Room.define_server_prefab(DoorState)
	Gs2Room.define_server_prefab(EnemyState)
	var box: int = Gs2Room.spawn_raw(BOX_PREFAB, 0, 50, 0)
	var door: int = Gs2Room.spawn(DoorState, 250, 100, 100)
	var enemy: int = Gs2Room.spawn(EnemyState, -250, 75, 100)
	Gs2Room.set_field(enemy, EnemyState.HEALTH, FULL_HEALTH)
	return Gs2Step.wait_for(on_interact, RoomState.new({box_id = box, door_id = door, enemy_id = enemy})).or_wait_for(on_timer)


static func on_interact(state: RoomState, object_id: int, method: int) -> Gs2Step:
	if object_id == state.door_id:
		if method == DoorAction.OPEN:
			if Gs2Room.get_bool(object_id, DoorState.IS_OPEN):
				return Gs2Step.ignore(ObjectSyncError.ALREADY_APPLIED)
			Gs2Room.set_bool(object_id, DoorState.IS_OPEN, true)
			Gs2Room.set_field(object_id, DoorState.ROTATION_Y, 1024) # 90 degrees
			Gs2Room.after(object_id, 8000, RoomTimer.CLOSE_DOOR)
		elif method == DoorAction.CLOSE:
			if not Gs2Room.get_bool(object_id, DoorState.IS_OPEN):
				return Gs2Step.ignore(ObjectSyncError.ALREADY_APPLIED)
			Gs2Room.set_bool(object_id, DoorState.IS_OPEN, false)
			Gs2Room.set_field(object_id, DoorState.ROTATION_Y, 0)
			Gs2Room.cancel_timer(object_id)
		else:
			return Gs2Step.ignore(ObjectSyncError.INVALID_OPERATION)
	elif object_id == state.enemy_id and method == EnemyAction.ATTACK:
		if Gs2Room.get_field(object_id, EnemyState.HEALTH) == 0:
			return Gs2Step.ignore(ObjectSyncError.ALREADY_APPLIED)
		Gs2Room.set_field(object_id, EnemyState.HEALTH, _damage_after(Gs2Room.get_field(object_id, EnemyState.HEALTH), DAMAGE))
		if Gs2Room.get_field(object_id, EnemyState.HEALTH) == 0:
			Gs2Room.after(object_id, 8000, RoomTimer.REVIVE_ENEMY)
	else:
		return Gs2Step.ignore(ObjectSyncError.INVALID_OPERATION)
	return Gs2Step.stay(state)


static func _damage_after(hp: int, damage: int) -> int:
	return maxi(0, hp - damage)


static func on_timer(state: RoomState, object_id: int, event_id: int) -> Gs2Step:
	if object_id == state.door_id and event_id == RoomTimer.CLOSE_DOOR:
		Gs2Room.set_bool(object_id, DoorState.IS_OPEN, false)
		Gs2Room.set_field(object_id, DoorState.ROTATION_Y, 0)
	elif object_id == state.enemy_id and event_id == RoomTimer.REVIVE_ENEMY:
		Gs2Room.set_field(object_id, EnemyState.HEALTH, FULL_HEALTH)
	else:
		return Gs2Step.ignore(ObjectSyncError.INVALID_OPERATION)
	return Gs2Step.stay(state)
