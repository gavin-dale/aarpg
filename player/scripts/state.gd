class_name State extends Node

# stores a reference to the player this state belongs to
static var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# what happens when the player enters this state
func enter() -> void:
	pass
	
# what happens when the player exits this state
func exit() -> void:
	pass

# what happens during the _process update in this State
func process(_delta: float) -> State:
	return null

# what happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null	
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> State:
	return null
	
