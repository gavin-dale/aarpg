class_name Hurtbox extends Area2D

signal hit(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(area_entered_handler)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# whenever hitbox enters hurtbox, call take damage on hitbox
func area_entered_handler(area: Area2D) -> void:
	# if owner != null and owner.has_method("damaged"): 
	if area is Hitbox:
		# should hitbox be responsible for implementing take damage?
		# area.owner.take_damage(damage)
		hit.emit(area.damage)
	pass

# 1. area_entered 

