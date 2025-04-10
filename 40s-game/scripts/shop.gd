extends Node2D

@onready var characters = $Characters

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#change scenes to the kitchen when the button is pressed
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Kitchen.tscn")
