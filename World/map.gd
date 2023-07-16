extends TileMap

@onready var cursor = %Cursor

var highlighted_tile: Vector2 = Vector2(0, 0)
var tile_id: Vector2i
var building_mode: bool
var tile_coords

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var mouse_pos = get_local_mouse_position()
		tile_coords = local_to_map(mouse_pos)
		highlighted_tile = tile_coords
		cursor.position = map_to_local(tile_coords)
		tile_id = get_cell_atlas_coords(0, highlighted_tile, false)

##Строительство дорог

func _input(event):
	if event is InputEventMouseButton and building_mode == true and tile_id == Vector2i(1, 0):
		set_cell(0,tile_coords ,1 ,Vector2i(1,1) )


func _on_button_pressed():
	if building_mode == false:
		building_mode = true
		print("build mode on")
		%Cursor/CostV.visible = true
	else:
		building_mode = false
		print("build mode off")
		%Cursor/CostV.visible = false
