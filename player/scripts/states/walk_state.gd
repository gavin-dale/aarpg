class_name WalkState extends CharacterState

@export var move_speed: float = 100
@onready var idle: IdleState = %IdleState
@onready var attack: AttackState = %AttackState

func enter() -> void:
	character.update_animation("walk")
	pass
	
func exit() -> void:
	pass

func process(_delta: float) -> CharacterState:
	if character.direction == Vector2.ZERO:
		return idle
		
	character.velocity = character.direction * move_speed
	
	if character.set_direction(character.direction):
		character.update_animation("walk")
		
	return null

func physics_process(_delta: float) -> CharacterState:
	return null	
	
func handle_input(_event: InputEvent) -> CharacterState:
	if _event.is_action_pressed("attack"): 
		return attack
	return null
	
