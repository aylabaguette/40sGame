extends Sprite2D
@onready var cup: Sprite2D = $"."

var mouseEntered = false
var holdingCup = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	print("hi")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("mouse click") && mouseEntered):
		holdingCup = !holdingCup
		
	if(holdingCup == true):
		cup.position = get_global_mouse_position()
	
func _on_area_2d_mouse_entered() -> void:
	mouseEntered = true
	
func _on_area_2d_mouse_exited() -> void:
	mouseEntered = false
