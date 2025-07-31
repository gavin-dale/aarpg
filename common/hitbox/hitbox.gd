class_name Hitbox extends Area2D

signal damaged(damage: int)

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

func take_damage(damage: int) -> void:
	print("TakeDamage: ", damage)

	# up to whatever entity uses this class to decide how damage is managed
	damaged.emit(damage)
