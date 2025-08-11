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

func set_direction(current_direction: Vector2) -> bool:
    if current_direction == Vector2.ZERO: 
        return false

	# take angle that could be between 0 and 360, make sure it's one of the cardinal directions
	# / TAU makes it a number between 0 and 1
	# + cardinal_direction * 0.1 fixes some bug where the animation toggles if you hold one direction that spam another
    var direction_id: int = int(round((current_direction + cardinal_direction * 0.1).angle() / TAU * DIRECTIONS.size()))

	# the magic above returns an index
    var new_direction = DIRECTIONS[direction_id] 
	
	# if they're the same, don't reassign anything
    if new_direction == cardinal_direction: 
        return false
		
    cardinal_direction = new_direction

	# player interactions host connects to this to rotation interaction areas
    direction_changed.emit(new_direction)
	
	# scale sprite to -1 instead of flipping because flipping only effects the sprite itself,
	# not anything around it
    sprite_2d.scale.x = -1 if cardinal_direction 	== Vector2.LEFT else 1
	
    return true

func update_animation(state: String) -> void:
    animation_player.play(state + "_" + anim_direction())

func anim_direction() -> String:
    if cardinal_direction == Vector2.DOWN:
        return "down"
    elif cardinal_direction == Vector2.UP:
        return "up"
    else: 
        return "side"
