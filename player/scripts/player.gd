class_name PlayerCharacter extends Character 

func _ready() -> void:
	init(10)
	# init(10, %CharacterStateMachine, %CharacterAnimationPlayer, %CharacterSprite2D, %CharacterHurtbox)

	PlayerCharacterManager.player = self
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	direction = Vector2(
		Input.get_axis('left', 'right'),  
		Input.get_axis('up', 'down')
		).normalized()

	# forces magnitude to stay at 1 even when direction is (1,1) which can make player walk to fast
	direction = direction.normalized()
	pass
	
