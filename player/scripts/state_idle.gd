class_name StateIdle extends State

@onready var walk: StateWalk = $"../Walk"

# what happens when the player enters this state
func enter() -> void:
	player.update_animation("idle")
	pass
	
# what happens when the player exits this state
func exit() -> void:
	pass

# what happens during the _process update in this State
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	# why is velocity set to zero? it's used by move_and_slide built-in physics processor
	player.velocity = Vector2.ZERO
	return null

# what happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> State:
	return null
	
