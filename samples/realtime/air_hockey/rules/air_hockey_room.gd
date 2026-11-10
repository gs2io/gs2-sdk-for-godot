# Room rules of the AirHockey sample (Unity's air-hockey sample, AirHockey.cs and SyncSchema.cs
# of the GS2-Realtime samples) in GDScript, on a 2D board. Godot never runs this script: the
# GS2 realtime authoring compiler turns it into the room's main.gsl and the classes in
# ../generated.
#
# Coordinates are pixels of the board (position precision 1; the origin is its centre, Y down)
# and velocities integer pixels per 12.5 ms substep: the Unity sample's centimetres on its XZ
# plane, with Z as Y. No physics engine: every 50 ms the room moves the puck in 4 substeps,
# bounces it off the rails and the paddles and counts the goals.
#
# Blue (prefab 5, the left half) and red (6, the right half) are leased for 6 seconds to the
# member who takes control and moved by that member; the puck (7) is the room's, with the
# scores, the phase (0 paused, 1 playing, 2 serving after a goal) and the hit count.
class_name AirHockeyRoom
extends Gs2RoomRules

const STATE := HockeyState
const RESULT := HockeyResult
const ERROR := HockeyError


# Paddle positions are those of the previous timer, for their velocity.
class HockeyState extends Gs2Record:
	var blue: int
	var red: int
	var puck: int
	var vx: int
	var vy: int
	var delay: int
	var blue_x: int
	var blue_y: int
	var red_x: int
	var red_y: int


class HockeyResult extends Gs2Record:
	var finished: bool


# The puck during one timer.
class Motion extends Gs2Record:
	var x: int
	var y: int
	var vx: int
	var vy: int
	var hits: int


enum HockeyError { INVALID_OPERATION = 5 }

# Wire slots stay stable when adding fields.
## @room_schema(5, standard=POSITION, position_precision=1.0)
enum BluePaddleState { POSITION_X = 0, POSITION_Y = 1 }

## @room_schema(6, standard=POSITION, position_precision=1.0)
enum RedPaddleState { POSITION_X = 0, POSITION_Y = 1 }

## @room_schema(7, standard=POSITION, position_precision=1.0)
enum PuckState {
	POSITION_X = 0,
	POSITION_Y = 1,
	BLUE_SCORE = 6,
	RED_SCORE = 7,
	PHASE = 8,
	HITS = 9,
}

# What members ask of the puck (Gs2SharedObject.interact(PuckAction.START_MATCH)).
## @room_action
enum PuckAction { START_MATCH = 1, PAUSE_MATCH = 2 }

## @room_timer
enum PuckTimer { STEP = 1 }

const LEASE_MILLISECONDS = 6000
const STEP_MILLISECONDS = 50


static func start() -> Gs2Step:
	Gs2Room.define_leased_prefab(BluePaddleState, LEASE_MILLISECONDS)
	Gs2Room.define_leased_prefab(RedPaddleState, LEASE_MILLISECONDS)
	Gs2Room.define_server_prefab(PuckState)
	var blue: int = Gs2Room.spawn(BluePaddleState, -450, 0)
	var red: int = Gs2Room.spawn(RedPaddleState, 450, 0)
	var puck: int = Gs2Room.spawn(PuckState, 0, 0)
	return Gs2Step.wait_for(on_interact, HockeyState.new({
		blue = blue, red = red, puck = puck, vx = 8, vy = 0, delay = 0,
		blue_x = -450, blue_y = 0, red_x = 450, red_y = 0,
	})).or_wait_for(on_timer)


# START_MATCH resets the scores and serves; PAUSE_MATCH stops the puck at the centre.
static func on_interact(state: HockeyState, object_id: int, method: int) -> Gs2Step:
	if object_id != state.puck or (method != PuckAction.START_MATCH and method != PuckAction.PAUSE_MATCH):
		return Gs2Step.ignore(HockeyError.INVALID_OPERATION)
	Gs2Room.cancel_timer(state.puck)
	Gs2Room.set_field(state.puck, PuckState.POSITION_X, 0)
	Gs2Room.set_field(state.puck, PuckState.POSITION_Y, 0)
	Gs2Room.set_field(state.puck, PuckState.PHASE, 1 if method == PuckAction.START_MATCH else 0)
	if method == PuckAction.START_MATCH:
		Gs2Room.set_field(state.puck, PuckState.BLUE_SCORE, 0)
		Gs2Room.set_field(state.puck, PuckState.RED_SCORE, 0)
		Gs2Room.set_field(state.puck, PuckState.HITS, 0)
		Gs2Room.after(state.puck, STEP_MILLISECONDS, PuckTimer.STEP)
	return Gs2Step.stay(state.with({vx = 8, vy = 0, delay = 0}))


static func on_timer(state: HockeyState, object_id: int, event_id: int) -> Gs2Step:
	if object_id != state.puck or event_id != PuckTimer.STEP:
		return Gs2Step.ignore(HockeyError.INVALID_OPERATION)
	var bx: int = Gs2RoomMath.clamp(Gs2Room.get_field(state.blue, BluePaddleState.POSITION_X), -555, -45)
	var by: int = Gs2RoomMath.clamp(Gs2Room.get_field(state.blue, BluePaddleState.POSITION_Y), -275, 275)
	var rx: int = Gs2RoomMath.clamp(Gs2Room.get_field(state.red, RedPaddleState.POSITION_X), 45, 555)
	var ry: int = Gs2RoomMath.clamp(Gs2Room.get_field(state.red, RedPaddleState.POSITION_Y), -275, 275)
	if state.delay > 0:
		Gs2Room.after(state.puck, STEP_MILLISECONDS, PuckTimer.STEP)
		if state.delay == 1:
			Gs2Room.set_field(state.puck, PuckState.PHASE, 1)
		return Gs2Step.stay(state.with({delay = state.delay - 1, blue_x = bx, blue_y = by, red_x = rx, red_y = ry}))
	var p := Motion.new({
		x = Gs2Room.get_field(state.puck, PuckState.POSITION_X),
		y = Gs2Room.get_field(state.puck, PuckState.POSITION_Y),
		vx = state.vx,
		vy = state.vy,
		hits = Gs2Room.get_field(state.puck, PuckState.HITS),
	})
	@warning_ignore("integer_division")
	var blue_vx: int = Gs2RoomMath.clamp(bx - state.blue_x, -48, 48) / 4
	@warning_ignore("integer_division")
	var blue_vy: int = Gs2RoomMath.clamp(by - state.blue_y, -48, 48) / 4
	@warning_ignore("integer_division")
	var red_vx: int = Gs2RoomMath.clamp(rx - state.red_x, -48, 48) / 4
	@warning_ignore("integer_division")
	var red_vy: int = Gs2RoomMath.clamp(ry - state.red_y, -48, 48) / 4
	for _substep in range(4):
		p = p.with({x = p.x + p.vx, y = p.y + p.vy})
		p = _hit(p, bx, by, blue_vx, blue_vy)
		p = _hit(p, rx, ry, red_vx, red_vy)
		# The rails above and below.
		if p.y > 304:
			p = p.with({y = 608 - p.y, vy = -Gs2RoomMath.abs(p.vy)})
		if p.y < -304:
			p = p.with({y = -608 - p.y, vy = Gs2RoomMath.abs(p.vy)})
		# The ends, outside the goals.
		if Gs2RoomMath.abs(p.y) > 94:
			if p.x > 584:
				p = p.with({x = 1168 - p.x, vx = -Gs2RoomMath.abs(p.vx)})
			if p.x < -584:
				p = p.with({x = -1168 - p.x, vx = Gs2RoomMath.abs(p.vx)})
		# A goal: the scorer's count goes up and the other side serves after 1.5 seconds.
		if p.x > 616 or p.x < -616:
			var field: int = PuckState.BLUE_SCORE if p.x > 0 else PuckState.RED_SCORE
			Gs2Room.set_field(state.puck, field, mini(999, Gs2Room.get_field(state.puck, field) + 1))
			Gs2Room.set_field(state.puck, PuckState.POSITION_X, 0)
			Gs2Room.set_field(state.puck, PuckState.POSITION_Y, 0)
			Gs2Room.set_field(state.puck, PuckState.PHASE, 2)
			Gs2Room.set_field(state.puck, PuckState.HITS, p.hits)
			Gs2Room.after(state.puck, STEP_MILLISECONDS, PuckTimer.STEP)
			return Gs2Step.stay(state.with({vx = -8 if p.x > 0 else 8, vy = 0, delay = 30, blue_x = bx, blue_y = by, red_x = rx, red_y = ry}))
	Gs2Room.set_field(state.puck, PuckState.POSITION_X, p.x)
	Gs2Room.set_field(state.puck, PuckState.POSITION_Y, p.y)
	Gs2Room.set_field(state.puck, PuckState.HITS, p.hits)
	Gs2Room.after(state.puck, STEP_MILLISECONDS, PuckTimer.STEP)
	return Gs2Step.stay(state.with({vx = p.vx, vy = p.vy, blue_x = bx, blue_y = by, red_x = rx, red_y = ry}))


# The puck after meeting a paddle at (x, y) moving by (vx, vy): pushed out of it and, when
# it moves into the paddle, reflected with some of the paddle's velocity.
static func _hit(p: Motion, x: int, y: int, vx: int, vy: int) -> Motion:
	var dx: int = p.x - x
	var dy: int = p.y - y
	var squared: int = dx * dx + dy * dy
	if squared >= 52 * 52:
		return p
	if squared == 0:
		dx = -1 if p.vx >= 0 else 1
		squared = 1
	var distance: int = maxi(1, Gs2RoomMath.sqrt(squared))
	var dot: int = (p.vx - vx) * dx + (p.vy - vy) * dy
	var next_vx: int = p.vx
	var next_vy: int = p.vy
	var hits: int = p.hits
	if dot < 0:
		@warning_ignore("integer_division")
		next_vx = Gs2RoomMath.clamp(p.vx - 2 * dot * dx / squared + vx / 2, -12, 12)
		@warning_ignore("integer_division")
		next_vy = Gs2RoomMath.clamp(p.vy - 2 * dot * dy / squared + vy / 2, -10, 10)
		if Gs2RoomMath.abs(next_vx) < 2:
			next_vx = -2 if dx < 0 else 2
		hits = (hits + 1) % 1000000
	@warning_ignore("integer_division")
	return Motion.new({x = x + dx * 53 / distance, y = y + dy * 53 / distance, vx = next_vx, vy = next_vy, hits = hits})
