class_name Plant extends Node2D

func _ready() -> void:
	$Hitbox.damaged.connect(take_damage)
	pass # Replace with function body.

func take_damage(_damange: int) -> void: 
	# queues up the node for getting removed/deleted from game
	# if it was an enemy, then you could check health
	queue_free()
