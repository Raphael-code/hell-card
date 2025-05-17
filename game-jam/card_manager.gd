extends Node2D

const key_list = ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
	'q', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'w', 'x', 'c',
	'v', 'b', 'n']

var curr_keys = key_list

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
