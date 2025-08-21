class_name Hitbox extends Area2D

# signal damaged(damage: int)
@export var damage: int = 1

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

# func take_damage(damage: int) -> void:
# 	print("TakeDamage: ", damage)

# 	damaged.emit(damage)
