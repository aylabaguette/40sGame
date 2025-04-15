extends Node2D
@onready var area_2d_cup: Area2D = $Cup/Area2DCup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#change scenes to shop when button pressed
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Shop.tscn")
