extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Shop.tscn")

func _on_dispenser_left_mouse_entered() -> void:
	if Input.is_action_just_pressed("left click"):
		print("haha left")

func _on_dispenser_right_mouse_shape_entered(shape_idx: int) -> void:
	if Input.is_action_just_pressed("left click"):
		print("haha right")
