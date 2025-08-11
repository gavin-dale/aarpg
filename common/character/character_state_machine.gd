class_name CharacterStateMachine extends Node

var states: Array[ CharacterState ]
var prev_state: CharacterState
var current_state: CharacterState

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass

func _process(delta: float):
	change_state(current_state.process(delta))
	pass

func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func init(character_ref: Character) -> void:
	states = []

	for child in get_children():
		if child is CharacterState:
			print(child)
			states.append(child)

	for state in states: 
		print(state)
		# state.character = character_ref
		# state.state_machine = self
		state.init(character_ref)
	
	if states.size() > 0:
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state(new_state: CharacterState) -> void: 
	# most state change functions return null, so if it gets a null, there is no state change
	# or if state is the same as current state
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.enter()
