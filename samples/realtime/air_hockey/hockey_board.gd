# GS2-Realtime object synchronization sample (not part of the addon).
#
# Draws the board in the rules' pixels (rules/air_hockey_room.gd): rails at y = +-304 and
# x = +-584 (the ends), goals where |y| <= 94, the centre line and spot.
@tool
extends Node2D


const HALF_WIDTH = 584.0
const HALF_HEIGHT = 304.0
const GOAL = 94.0
const RAIL = Color(0.75, 0.78, 0.85)


func _draw() -> void:
    draw_rect(Rect2(-HALF_WIDTH, -HALF_HEIGHT, HALF_WIDTH * 2, HALF_HEIGHT * 2), Color(0.12, 0.2, 0.3))
    draw_line(Vector2(0, -HALF_HEIGHT), Vector2(0, HALF_HEIGHT), Color(0.8, 0.3, 0.3), 3.0)
    draw_arc(Vector2.ZERO, 60.0, 0.0, TAU, 48, Color(0.8, 0.3, 0.3), 3.0)
    draw_line(Vector2(-HALF_WIDTH, -HALF_HEIGHT), Vector2(HALF_WIDTH, -HALF_HEIGHT), RAIL, 6.0)
    draw_line(Vector2(-HALF_WIDTH, HALF_HEIGHT), Vector2(HALF_WIDTH, HALF_HEIGHT), RAIL, 6.0)
    for side in [-1.0, 1.0]:
        var x: float = side * HALF_WIDTH
        draw_line(Vector2(x, -HALF_HEIGHT), Vector2(x, -GOAL), RAIL, 6.0)
        draw_line(Vector2(x, GOAL), Vector2(x, HALF_HEIGHT), RAIL, 6.0)
        draw_line(Vector2(x, -GOAL), Vector2(x, GOAL), Color(0.3, 0.6, 1.0) if side < 0 else Color(1.0, 0.35, 0.35), 2.0)
