class_name CharacterState extends Node

var character: Character

func init(character_ref: Character) -> void:
    character = character_ref
    on_character_ready()

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

# override in children for operations that need to be done after character _ready() is called
# since state is a child of character, signals might not be connectable via state _ready()
func on_character_ready() -> void:
    pass