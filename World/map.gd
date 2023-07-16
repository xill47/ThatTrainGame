extends TileMap

@onready var cursor = %Cursor

var highlighted_tile: Vector2 = Vector2(0, 0)
var building_mode: bool


func set_building_mode(mode: bool):
	building_mode = mode
	cursor.set_cost_visible(building_mode)
	print("build mode: ", building_mode)


func _ready():
	EventBus.change_railway_build_mode.connect(func(): set_building_mode(!building_mode))
	set_building_mode(false)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var mouse_pos = get_local_mouse_position()
		var tile_coords = local_to_map(mouse_pos)
		highlighted_tile = tile_coords
		cursor.position = map_to_local(tile_coords)

	if (event.is_action("confirm_select_build")) and building_mode:
		_try_build()


# Mouse button doesn't work in _unhandled_input???
func _input(event):
	if (
		(
			event is InputEventMouseButton
			and event.pressed
			and event.button_index == MOUSE_BUTTON_LEFT
		)
		and building_mode
	):
		_try_build()


func _try_build():
	var tile_data = get_cell_tile_data(0, highlighted_tile)
	if tile_data == null:
		return
	var cost = tile_data.get_custom_data("cost")
	if cost > 0:
		print("cost: ", cost)
		set_cell(0, highlighted_tile, 1, Vector2i(1, 1))


func _on_build_button_pressed():
	set_building_mode(!building_mode)
