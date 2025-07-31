class_name StateAttack extends State

var attacking: bool = false

@export var attack_sound: AudioStream
@export_range(1, 20, 0.5) var decelerate_speed: float = 5

@onready var walk: StateWalk = $"../Walk"
@onready var idle: StateIdle = $"../Idle"
@onready var hurtbox: Hurtbox = $"../../Interactions/Hurtbox"


@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

# what happens when the player enters this state
func enter() -> void:
	player.update_animation("attack")
	attack_animation_player.play("attack_" + player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true


# small delay before enabling the hurtbox 
	await get_tree().create_timer(0.075).timeout

	hurtbox.monitoring = true

	pass
	
# what happens when the player exits this state
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)

	hurtbox.monitoring = false
	pass

# what happens during the _process update in this State
func process(_delta: float) -> State:
	# causes player to slow just a bit if you want while running
	player.velocity -= player.velocity * decelerate_speed * _delta

	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else: 
			return walk

	return null

# what happens during the _physics_process update in this State
func physics(_delta: float) -> State:
	return null
	
# what happens with input events in this State
func handle_input(_event: InputEvent) -> State:
	return null
	
func end_attack(_new_anim_name: String) -> void: 
	attacking = false