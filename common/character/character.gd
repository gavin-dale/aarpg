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

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hitbox: Hitbox = $Hitbox
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

func _ready() -> void:
	state_machine.init(self)
	pass 

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
