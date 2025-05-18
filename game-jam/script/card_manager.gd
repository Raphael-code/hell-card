extends Node2D

const key_list = [KEY_A, KEY_Z, KEY_E, KEY_R, KEY_T, KEY_Y, KEY_U, KEY_I, KEY_O, KEY_P,
	KEY_Q, KEY_S, KEY_D, KEY_F, KEY_G, KEY_H, KEY_J, KEY_K, KEY_L, KEY_M,
	KEY_W, KEY_X, KEY_C, KEY_V, KEY_B, KEY_N]

class CardObject:
	var name = ""
	var command = [0, 1, 2]
	var curr_keys = key_list

	func ShuffleKeys():
		var new_keys = []
		var index = 0

		while true:
			index = randf_range(0, 26)
			if (key_list[index] not in new_keys):
				new_keys.append(key_list[index])

			if (len(new_keys) == 26):
				curr_keys = new_keys
				return

	func print_current_key():
		for i in command:
			print(curr_keys[i])


var Input_mode: bool = false
var Input_list = []


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			Input_mode = !Input_mode
			if Input_mode:
				Input_list.clear()

		if Input_mode and event.keycode in key_list:
			Input_list.append(event.keycode)


func check_if_correctInput(card: CardObject) -> bool:
	if !Input_mode: # if not in input mode
		if !Input_list.is_empty(): # is the Input list not empty ?
			print(Input_list)
			if len(Input_list) != len(card.command): # if not the same length, false
				return false
			for i in range(0, len(card.command)): # cycle through the commands
				if card.curr_keys[card.command[i]] != Input_list[i]: # if the keycode is not the same, false
					return false
			Input_list.clear()
			return true # keycodes are the same, true
	return false # was in input mode
