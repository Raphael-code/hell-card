extends Node2D

var Input_mode: bool = false
var Input_list = []

signal left_mouse_button_clicked
signal left_mouse_button_released

const COLLISION_MASK_CARD = 1
const COLLISION_MASK_DECK = 4

var card_manager_reference
var deck_reference

func _ready() -> void:
	card_manager_reference  = $"../card manager"
	deck_reference = $"../Deck"

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			emit_signal("left_mouse_button_clicked")
			raycast_at_cursor()
		else:
			emit_signal("left_mouse_button_released")

	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			Input_mode = !Input_mode

			if Input_mode:
				Input_list.clear()

		if Input_mode and event.keycode in CardManager.key_list:
			Input_list.append(event.keycode)

func check_if_correctInput(card):
	if !Input_mode:
		if !Input_list.is_empty():
			if len(Input_list) != len(card.command):
				return
			for i in range(0, len(card.command)):
				if CardManager.key_list[card.command[i]] != Input_list[i]:
					return
			Input_list.clear()
			card.blocked = false

func raycast_at_cursor():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		var result_collision_mask = result[0].collider.collision_mask
		if result_collision_mask == COLLISION_MASK_CARD:
			var card_found = result[0].collider.get_parent()
			if card_found:
				card_manager_reference.start_drag(card_found)
		elif result_collision_mask == COLLISION_MASK_DECK:
			deck_reference.draw_card()
