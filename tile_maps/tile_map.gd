class_name TileMapManager extends TileMapLayer

# when a tile map loads, it will figure out its bounds using get_tile_map_bounds, then pass that to the level manager
# level manager will emit the bounds
func _ready() -> void:
	print('tile map manager ready')
	LevelManager.change_tile_map_bounds(get_tile_map_bounds())
	pass 

# order matters here! LevelManager singleton expects 
func get_tile_map_bounds() -> Array[Vector2]:
	print('getting tile map bounds in tile map script')
	var bounds: Array[Vector2] = []

	# position is in terms of tiles, not pixels, so multiply by tile size (rendering quadrant size which is prop of TileMap)
	bounds.append(Vector2(get_used_rect().position * rendering_quadrant_size))

	# end is bottom right corner of bounding box
	bounds.append(Vector2(get_used_rect().end * rendering_quadrant_size))

	return bounds
