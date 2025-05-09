extends Sprite2D
@onready var cup: Sprite2D = $"."

#true if mouse is within the area of the cup 
var mouseEntered = false

#true if cup is following mouse
var holdingCup = false

var toppingInCup = false
var newInstanceInCup = false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#if the mouse is clicked within the area of the cup pickup/drop cup
	if(Input.is_action_just_pressed("mouse click") && mouseEntered):
		holdingCup = !holdingCup
		
	#make cup follow mouse 
	if(holdingCup == true):
		cup.position = get_global_mouse_position()
		
	if(toppingInCup):
		var cupPosition = cup.position
		SignalBus.toppingInCup.emit(cupPosition)
	
	if(newInstanceInCup):
		print("inCup")
		SignalBus.toppingInCup.emit(newInstanceInCup)
	
#signals that activate when mouse is within area of cup 
func _on_area_2d_mouse_entered() -> void:
	mouseEntered = true
	
func _on_area_2d_mouse_exited() -> void:
	mouseEntered = false
	
func _on_area_2d_cup_area_entered(area: Area2D) -> void:
	if(area.is_in_group("topping")):
		toppingInCup = true 
		
	if(area.is_in_group("newInstanceTopping")):
		newInstanceInCup = true

func _on_area_2d_cup_area_exited(area: Area2D) -> void:
	toppingInCup = false 
