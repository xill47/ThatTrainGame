extends Camera2D

@export var speed = 10
@export var zoom_speed = 3


func _process(delta):
	var requested_direction := Input.get_vector(
		"camera_left", "camera_right", "camera_up", "camera_down"
	)
	offset += requested_direction * speed * delta

	var requested_zoom := Input.get_axis("camera_zoom_out", "camera_zoom_in")
	if requested_zoom < 0.1:
		if Input.is_action_just_released("camera_zoom_out"):
			requested_zoom += -1
		elif Input.is_action_just_released("camera_zoom_in"):
			requested_zoom += 1
	zoom += Vector2(requested_zoom, requested_zoom) * zoom_speed * delta
