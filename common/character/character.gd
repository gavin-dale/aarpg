class_name Character extends CharacterBody2D
# can prob do more in this class
# hp, damanaged function
# state machine init 
# set direction

signal direction_changed(new_direction: Vector2)
signal damaged(damage:int)

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

# @onready var animation_player: AnimationPlayer = $AnimationPlayer
# @onready var sprite_2d: Sprite2D = $Sprite2D
# @onready var hitbox: Hitbox = $Hitbox
# @onready var state_machine: CharacterStateMachine = $CharacterStateMachine

var state_machine: CharacterStateMachine
var animation_player: AnimationPlayer
var sprite_2d: Sprite2D
var hitbox: Hitbox

func init(
    state_machine_ref: CharacterStateMachine,
    animation_player_ref: AnimationPlayer,
    sprite_2d_ref: Sprite2D,
    # hitbox_ref: Hitbox
) -> void:
    state_machine = state_machine_ref
    animation_player = animation_player_ref
    sprite_2d = sprite_2d_ref
    # hitbox = hitbox_ref
    state_machine.init(self) # or wherever init belongs

func _physics_process(_delta: float) -> void:
    move_and_slide()

# for refactor - same as player
func update_animation(state: String) -> void:
    animation_player.play(state + "_" + anim_direction())

# for refactor - same as player
func anim_direction() -> String:
    if cardinal_direction == Vector2.DOWN:
        return "down"
    elif cardinal_direction == Vector2.UP:
        return "up"
    else: 
        return "side"
