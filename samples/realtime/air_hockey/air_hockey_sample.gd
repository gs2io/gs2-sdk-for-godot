# GS2-Realtime object synchronization sample (not part of the addon).
#
# AirHockey (Unity's AirHockeySample and AirHockeyView) on a 2D board. The room's rules
# (rules/air_hockey_room.gd) spawn the blue (prefab 5) and red (6) paddles and the puck (7),
# move the puck and count the goals; a member joins a side by taking that paddle's lease
# (Gs2NetworkEntity.acquire_control, renewed while held) and moves it with the keys or the
# mouse. The puck's scores reach the score label through property bindings (its Score node).
extends "res://samples/realtime/shared/realtime_sync_sample.gd"


const HockeyScore = preload("res://samples/realtime/air_hockey/hockey_score.gd")
const PaddleMovement = preload("res://samples/realtime/air_hockey/paddle_movement.gd")

const PHASES = ["PAUSED", "PLAYING", "SERVING"]

## The room's paddles and puck (null until the room has them) and the paddle this client asked
## for.
var blue: Gs2NetworkEntity = null
var red: Gs2NetworkEntity = null
var selected: Gs2NetworkEntity = null
var puck: Gs2SharedObject = null
var score: HockeyScore = null

@onready var _score_label: Label = get_node("Board/Score")


func _add_actions() -> void:
    add_action("Join blue", join_blue)
    add_action("Join red", join_red)
    add_action("Spectate", spectate)
    add_action("Start / reset", start_match)
    add_action("Pause", pause_match)


func _process(delta: float) -> void:
    super(delta)
    _score_label.text = score_text()


func _on_spawned(entity: Gs2NetworkEntity) -> void:
    if entity.is_prefab(BluePaddleStateSchema.PREFAB):
        blue = entity
    elif entity.is_prefab(RedPaddleStateSchema.PREFAB):
        red = entity
    elif entity.is_prefab(PuckStateSchema.PREFAB):
        var root := entity.get_parent()
        puck = root.get_node("Shared") as Gs2SharedObject
        score = root.get_node("Score") as HockeyScore


func _on_room_cleared() -> void:
    blue = null
    red = null
    selected = null
    puck = null
    score = null


func _status() -> String:
    return role()


## Which side this client plays.
func role() -> String:
    if selected == null or not selected.has_control:
        return "SPECTATOR"
    return "BLUE / LEFT" if selected == blue else "RED / RIGHT"


func score_text() -> String:
    if score == null:
        return "-"
    return "BLUE %d : %d RED\n%s / hits %d" % [score.blue, score.red, PHASES[score.phase] if score.phase >= 0 and score.phase < PHASES.size() else str(score.phase), score.hits]


# ---- The buttons ----

func join_blue() -> void:
    _join(blue, "Join blue")


func join_red() -> void:
    _join(red, "Join red")


func _join(paddle: Gs2NetworkEntity, label: String) -> void:
    if paddle == null or not room_ready():
        return
    if selected != paddle:
        spectate()
    selected = paddle
    # LEASE_BUSY when another member holds it.
    track(paddle.acquire_control(), label)


func spectate() -> void:
    if selected != null:
        selected.release_control()
    selected = null


func start_match() -> void:
    if puck != null and room_ready():
        track(puck.interact(PuckAction.START_MATCH), "Start")


func pause_match() -> void:
    if puck != null and room_ready():
        track(puck.interact(PuckAction.PAUSE_MATCH), "Pause")


## Moves the paddle this client holds (by pixels).
func move_paddle(delta: Vector2) -> void:
    if selected != null and selected.has_control:
        (selected.get_parent().get_node("Movement") as PaddleMovement).move(delta)
