extends Node2D

var player_deck = ["Knight", "Knight", "Knight"]

const CARD_SCENE_PATH = "../scene/soldat1.tscn"
const CARD_DRAW_SPEED = 1

func _ready() -> void:
	$RichTextLabel.text = str(player_deck.size())

func draw_card():
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	$"../card manager".add_child(new_card)
	new_card.name = "Carte"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
