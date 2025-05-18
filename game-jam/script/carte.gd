extends Node2D

signal hover
signal hover_off

var starting_position
var card_is_in_slot
var card_type
var blocked = true

func _ready() -> void:
	get_parent().connect_card_signals(self)

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hover", self)

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hover_off", self)
