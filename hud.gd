extends Control

func _on_rail_button_pressed():
	EventBus.change_railway_build_mode.emit()
