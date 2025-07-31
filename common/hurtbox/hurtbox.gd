class_name Hurtbox extends Area2D

@export var damage: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(area_entered_handler)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# whenever hitbox enters hurtbox, call take damage on hitbox
func area_entered_handler(area: Area2D) -> void:
	if area is Hitbox: 
		area.take_damage(damage)
	pass

# 1. area_entered 

