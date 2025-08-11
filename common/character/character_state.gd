class_name CharacterState extends Node

var character: Character
# var state_machine: CharacterStateMachine

func init(character_ref: Character) -> void:
    character = character_ref

func enter() -> void: 
    pass

func exit() -> void: 
    pass

func process(_delta: float) -> CharacterState:
    return null

func physics_process(_delta) -> CharacterState:
    return null

# what happens with input events in this State
func handle_input(_event: InputEvent) -> CharacterState:
    return null