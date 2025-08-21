class_name EnemyIdleState extends CharacterState

@export var animation_name: String = 'idle'
@export_category('AI')
@export var state_duration_min: float = 0.5
@export var state_duration_max: float = 1.5

@onready var next_state: CharacterState = %WalkState

var timer: float = 0.0

func enter() -> void:
    character.velocity = Vector2.ZERO

    # assign random duration to state timer
    timer = randf_range(state_duration_min, state_duration_max)
    character.update_animation(animation_name)

func process(delta: float) -> CharacterState:
    # decrease timer every time
    timer -= delta

    # return previous state
    if(timer <= delta): 
        return next_state
    
    return null