class_name Enemy extends Character

# signal direction_changed(new_direction: Vector2)
# signal enemy_damaged()

# const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@export var hp: int = 3

# var cardinal_direction: Vector2 = Vector2.DOWN
# var direction: Vector2 = Vector2.ZERO
# var player: Player
# var invulnerable: bool = false

# @onready var animation_player: AnimationPlayer = $AnimationPlayer
# @onready var sprite_2d: Sprite2D = $Sprite2D
# @onready var hitbox: Hitbox = $Hitbox

# can probably be refactored to into base state class
# @onready var state_machine: EnemyStateMachine = $EnemyStateMachine

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

# for refactor - same as player
# func _physics_process(_delta: float) -> void:
# 	move_and_slide()

# for refactor - very similar to player
# slightly different from player in that we provide new direction instead of getting it from input
func set_direction(_new_direction) -> bool:
	direction = _new_direction
	if direction == Vector2.ZERO: 
		return false

	# take angle that could be between 0 and 360, make sure it's one of the cardinal directions
	# / TAU makes it a number between 0 and 1
	# + cardinal_direction * 0.1 fixes some bug where the animation toggles if you hold one direction that spam another
	var direction_id: int = int(round((direction + cardinal_direction * 0.1).angle() / TAU * DIRECTIONS.size()))

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

# for refactor - same as player
# func update_animation(state: String) -> void:
# 	animation_player.play(state + "_" + anim_direction())


# for refactor - same as player
# func anim_direction() -> String:
# 	if cardinal_direction == Vector2.DOWN:
# 		return "down"
# 	elif cardinal_direction == Vector2.UP:
# 		return "up"
# 	else: 
# 		return "side"