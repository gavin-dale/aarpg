# this class is an auto load singleton for managing tile map bounds
extends Node

var current_tile_map_bounds: Array[Vector2]

signal tile_map_bounds_changed(bounds: Array[Vector2])

# any time we load a new tile map, we call this func to set and emit new bounds
func change_tile_map_bounds(bounds: Array[Vector2]) -> void:
    current_tile_map_bounds = bounds
    tile_map_bounds_changed.emit(bounds)

