extends Node2D

class_name CardManager

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
