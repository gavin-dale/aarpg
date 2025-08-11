class_name Player extends Character 

func _ready() -> void:
	init(%PlayerCharacterStateMachine, %PlayerAnimationPlayer, $PlayerSprite2D)
	state_machine.init(self)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2(
		Input.get_axis('left', 'right'),  
		Input.get_axis('up', 'down')
		).normalized()

	# forces magnitude to stay at 1 even when direction is (1,1) which can make player walk to fast
	direction = direction.normalized()
	pass
	
