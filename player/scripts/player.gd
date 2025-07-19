class_name Player extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var move_speed: float = 100
var state: String = "idle"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") 	- Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * move_speed
	
	if set_state() == true:
		update_animation()
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	
	return true
	
func set_state() -> bool:
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	else: 
		state = new_state
		return true

func update_animation() -> void:
	animation_player.play(state + "_" + "down")
	pass
	
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else: 
		return "side"
