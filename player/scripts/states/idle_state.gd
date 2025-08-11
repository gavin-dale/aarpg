class_name IdleState extends CharacterState

@onready var walk: WalkState = %WalkState
@onready var attack: AttackState = %AttackState

# what happens when the player enters this state
func enter() -> void:
	character.update_animation("idle")
	pass
	
# what happens when the player exits this state
func exit() -> void:
	pass

# what happens during the _process update in this State
func process(_delta: float) -> CharacterState:
	if character.direction != Vector2.ZERO:
		return walk
	
	# why is velocity set to zero? it's used by move_and_slide built-in physics processor
	character.velocity = Vector2.ZERO
	return null

# what happens during the _physics_process update in this State
func physics_process(_delta: float) -> CharacterState:
	return null
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> CharacterState:
	if _event.is_action_pressed("attack"): 
		return attack
	return null
