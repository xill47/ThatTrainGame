extends TileMap

var highlighted_tile: Vector2 = Vector2(0, 0)

@export_group("Highlight")
@export var highlight_layer_id := 1
@export var highlight_tileset_source_id := 1
@export var highlight_atlas_coords := Vector2i(0, 0)
@export var highlight_alternative_id := 0


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var mouse_pos = get_local_mouse_position()
		var tile_coords = local_to_map(mouse_pos)
		erase_cell(highlight_layer_id, highlighted_tile)
		highlighted_tile = tile_coords
		set_cell(highlight_layer_id, highlighted_tile, 1, Vector2i(0, 0), 0)
