class_name Player extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

signal direction_changed(new_direction: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.init(self)
	pass # Replace with function body.

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
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	var new_direction: Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO: 
		return false
	
	if direction.y == 0: 
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
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

func update_animation(state: ) -> void:
	animation_player.play(state + "_" + anim_direction())
	pass
	
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else: 
		return "side"
