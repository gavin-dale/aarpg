class_name AttackState extends CharacterState

var attacking: bool = false

@export var attack_sound: AudioStream
@export_range(1, 20, 0.5) var decelerate_speed: float = 5

@onready var walk: WalkState = %WalkState
@onready var idle: IdleState = %IdleState
@onready var hurtbox: Hurtbox = %AttackHurtbox

@onready var animation_player: AnimationPlayer = %PlayerAnimationPlayer
@onready var attack_animation_player: AnimationPlayer = %AttackAnimationPlayer
@onready var audio: AudioStreamPlayer2D = %SwordSwooshAudioStreamPlayer

func enter() -> void:
	character.update_animation("attack")
	attack_animation_player.play("attack_" + character.anim_direction())
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
func process(_delta: float) -> CharacterState:
	# causes player to slow just a bit if you want while running
	character.velocity -= character.velocity * decelerate_speed * _delta

	if attacking == false:
		if character.direction == Vector2.ZERO:
			return idle
		else: 
			return walk

	return null

func end_attack(_new_anim_name: String) -> void: 
	attacking = false
