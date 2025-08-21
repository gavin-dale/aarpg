class_name EnemyStunState extends CharacterState

@export var animation_name: String = 'stun'
@export var knockback_speed: float = 200
@export var decelerate_speed: float = 10.0

@export_category('AI')
@onready var next_state: CharacterState = %IdleState

var direction: Vector2
var animation_finished: bool = false

func enter() -> void:
	animation_finished = false
	character.velocity = Vector2.ZERO

	var direction_randomizer = randi_range(0,3)
	direction = character.DIRECTIONS[direction_randomizer]

	character.set_direction(direction)
	character.velocity = direction * -knockback_speed
	character.update_animation(animation_name)

func process(delta: float) -> CharacterState:
	if animation_finished == true: 
		return next_state
		
	character.velocity -= character.velocity * decelerate_speed * delta
	
	return null

func on_damaged() -> void:
	print('stun state')
	character.state_machine.change_state(self)

func on_character_ready() -> void:
	print('stun state on char ready')
	character.damaged.connect(on_damaged)
