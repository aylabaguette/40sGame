extends Node2D
@onready var lychee_jelly: Sprite2D = $"lychee jelly"
@onready var coconut_jelly: Sprite2D = $"coconut jelly"
@onready var mango_popping: Sprite2D = $"mango popping"
@onready var milk_foam: Sprite2D = $"milk foam"
@onready var red_bean: Sprite2D = $"red bean"
@onready var tapioca: Sprite2D = $tapioca
@onready var popping_pearls: Sprite2D = $"popping pearls"

@onready var topping_drag: Sprite2D = $"../toppingDrag"


var unlockedToppings = [lychee_jelly,coconut_jelly,mango_popping,milk_foam,red_bean,tapioca,popping_pearls]
var totalToppings = []

var unlockedToppingsCup = []
var totalToppingsCup = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(unlockedToppings[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("mouse click")):
		var mousePos = get_local_mouse_position()
	
		for topping in range(unlockedToppings.size()):
			var currentTopping
			#print(topping)
			
			currentTopping = unlockedToppings[topping]
			
			#print(currentTopping)

			#if(lychee_jelly.get_viewport_rect().has_point(mousePos)):
				#print("inside")
			
		
		
