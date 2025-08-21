class_name Enemy extends Character

var player_character: PlayerCharacter

func _ready() -> void:
	init(10)
	# init(10, %CharacterStateMachine, %CharacterAnimationPlayer, %CharacterSprite2D, %Hurtbox)

	# potential bug - if enemy is loaded before player, then player will not have populated the pcm
	# player just needs to come first in scene tree 
	player_character = PlayerCharacterManager.player
