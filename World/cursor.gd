extends Node2D

@onready var cost_container: Control = %CostContainer


func set_cost_visible(cost_visible: bool):
	cost_container.visible = cost_visible
