extends Node2D

signal hover
signal hover_off

var starting_position

func _ready() -> void:
	get_parent().connect_card_signals(self)

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hover", self)

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hover_off", self)
