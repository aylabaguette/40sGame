extends Sprite2D
@onready var cup: Sprite2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	print("entered area")
	if(Input.is_action_just_pressed("mouse click")):
		print("yay")
		cup.position = get_global_mouse_position()
