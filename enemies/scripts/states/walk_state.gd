class_name EnemyWalkState extends CharacterState

@export var animation_name: String = 'walk'
@export var walk_speed: float = 20

@export_category('AI')
@export var state_duration: float = 0.7 # length of enemy animation
@export var state_cycles_min: int = 1
@export var state_cycles_max: int = 3

@onready var next_state: CharacterState = %IdleState

var timer: float = 0.0

func enter() -> void:
	character.velocity = Vector2.ZERO

	# use "cycles" which is number of times to cycle through walk animation
	# avoids jarring animation end mid animation cycle
	timer = randi_range(state_cycles_min, state_cycles_max) * state_duration
	var direction_randomizer = randi_range(0,3)
	var direction = character.DIRECTIONS[direction_randomizer]
	character.velocity = direction * walk_speed
	character.set_direction(direction)
	character.update_animation(animation_name)

func process(delta: float) -> CharacterState:
	# decrease timer every time
	timer -= delta


	# return previous state
	if(timer <= delta): 
		return next_state
	
	return null
