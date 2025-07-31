class_name PlayerCamera extends Camera2D

# tile map manager gets tile map bounds and sends them to level manager on load
# here we connect to level manager signal so we can get new limits 
func _ready() -> void:
	LevelManager.tile_map_bounds_changed.connect(update_limits)

	# PlayerCamera will load after auto load scripts (LevelManager), so set explicitly here
	# after load, limits will be updated via LevelManager signal
	update_limits(LevelManager.current_tile_map_bounds)
	pass # Replace with function body.

# automatically sets camera limits to map size
func update_limits(bounds: Array[Vector2]) -> void: 
	print('updating limits in player camera')

	if bounds == []:
		return

	limit_left = int(bounds[0].x)
	limit_top = int(bounds[0].y)
	limit_right = int(bounds[1].x)
	limit_bottom = int(bounds[1].y)
	pass