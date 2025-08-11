class_name Player extends Character 

# var cardinal_direction: Vector2 = Vector2.DOWN
# var direction: Vector2 = Vector2.ZERO

# const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

# @onready var animation_player: AnimationPlayer = $AnimationPlayer
# @onready var sprite_2d: Sprite2D = $Sprite2D
# @onready var state_machine: CharacterStateMachine = $CharacterStateMachine

# moving to base class
# signal direction_changed(new_direction: Vector2)

func _ready() -> void:
	init(%PlayerCharacterStateMachine, %PlayerAnimationPlayer, $PlayerSprite2D)
	state_machine.init(self)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	# direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	direction = Vector2(
		Input.get_axis('left', 'right'),  
		Input.get_axis('up', 'down')
		).normalized()

	# forces magnitude to stay at 1 even when direction is (1,1) which can make player walk to fast
	direction = direction.normalized()
	pass
	
# func _physics_process(delta: float) -> void:
# 	move_and_slide()

func set_direction() -> bool:
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

# func update_animation(state: ) -> void:
# 	animation_player.play(state + "_" + anim_direction())
# 	pass
	
# func anim_direction() -> String:
# 	if cardinal_direction == Vector2.DOWN:
# 		return "down"
# 	elif cardinal_direction == Vector2.UP:
# 		return "up"
# 	else: 
# 		return "side"
