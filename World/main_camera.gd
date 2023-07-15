extends Camera2D

@export var speed = 10


func _process(delta):
	var requested_direction := Input.get_vector(
		"camera_left", "camera_right", "camera_up", "camera_down"
	)
	offset += requested_direction * speed * delta

	var requested_zoom := Input.get_axis("camera_zoom_in", "camera_zoom_out")
	zoom += requested_zoom * speed * delta

