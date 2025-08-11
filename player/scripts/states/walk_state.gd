class_name WalkState extends CharacterState

@export var move_speed: float = 100
@onready var idle: IdleState = %IdleState
@onready var attack: AttackState = %AttackState

# what happens when the player enters this state
func enter() -> void:
	character.update_animation("walk")
	pass
	
# what happens when the player exits this state
func exit() -> void:
	pass

# what happens during the _process update in this State
func process(_delta: float) -> CharacterState:
	if character.direction == Vector2.ZERO:
		return idle
		
	character.velocity = character.direction * move_speed
	
	if character.set_direction():
		character.update_animation("walk")
		
	return null

# what happens during the _physics_process update in this State
func physics(_delta: float) -> CharacterState:
	return null	
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> CharacterState:
	if _event.is_action_pressed("attack"): 
		return attack
	return null
	
