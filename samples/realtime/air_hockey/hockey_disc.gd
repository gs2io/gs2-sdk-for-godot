# GS2-Realtime object synchronization sample (not part of the addon).
#
# Draws a paddle or the puck as a disc (Unity's HockeyDisc mesh).
@tool
extends Node2D


@export var radius := 20.0:
    set(value):
        radius = value
        queue_redraw()
@export var color := Color.WHITE:
    set(value):
        color = value
        queue_redraw()


func _draw() -> void:
    draw_circle(Vector2.ZERO, radius, color)
    draw_arc(Vector2.ZERO, radius, 0.0, TAU, 48, color.darkened(0.4), 3.0)
