extends Node2D
@onready var lychee_jelly: Sprite2D = $"lychee jelly"
@onready var coconut_jelly: Sprite2D = $"coconut jelly"
@onready var mango_popping: Sprite2D = $"mango popping"
@onready var milk_foam: Sprite2D = $"milk foam"
@onready var red_bean: Sprite2D = $"red bean"
@onready var tapioca: Sprite2D = $tapioca
@onready var popping_pearls: Sprite2D = $"popping pearls"

@onready var topping_drag: Sprite2D = $"../toppingDrag"

var unlockedToppings

var totalToppings = []

var unlockedToppingsCup = []
var totalToppingsCup = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	unlockedToppings = [lychee_jelly,coconut_jelly,mango_popping,milk_foam,red_bean,tapioca,popping_pearls]
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	for topping in range(unlockedToppings.size()):
		var currentTopping
		
		currentTopping = unlockedToppings[topping]
		var mousePos = get_global_mouse_position()
		var local_mouse_pos = currentTopping.to_local(mousePos)
									
		if(currentTopping.get_rect().has_point(local_mouse_pos)):
			print(currentTopping)
				
			
			
