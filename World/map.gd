extends TileMap

@onready var cursor = %Cursor

var highlighted_tile: Vector2 = Vector2(0, 0)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var mouse_pos = get_local_mouse_position()
		var tile_coords = local_to_map(mouse_pos)
		highlighted_tile = tile_coords
		cursor.position = map_to_local(tile_coords)
