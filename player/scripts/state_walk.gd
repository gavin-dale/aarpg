class_name StateWalk extends State

@export var move_speed: float = 100
@onready var idle: StateIdle = $"../Idle"

# what happens when the player enters this state
func enter() -> void:
	player.update_animation("walk")
	pass
	
# what happens when the player exits this state
func exit() -> void:
	pass

# what happens during the _process update in this State
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
		
	return null

# what happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null	
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> State:
	return null
	
