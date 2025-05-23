extends Area2D
@onready var lids: Area2D = $"."
@onready var lid_drag_: Sprite2D = $"../Lid(drag)"

var holdingLid = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lid_drag_.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(holdingLid == true):
		#make the single lid follow the mouse
		lid_drag_.position = get_global_mouse_position()

#called when the button which is on the stack of lids is pressed
func _on_button_pressed() -> void:
	holdingLid = true 
	#makes the lid that follows the mouse visible 
	lid_drag_.visible = true

	
