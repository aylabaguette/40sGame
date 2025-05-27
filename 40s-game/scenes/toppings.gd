extends Node2D
#initialize sprites for topping cubs
@onready var lychee_jelly: Sprite2D = $"lychee jelly"
@onready var coconut_jelly: Sprite2D = $"coconut jelly"
@onready var mango_popping: Sprite2D = $"mango popping"
@onready var milk_foam: Sprite2D = $"milk foam"
@onready var red_bean: Sprite2D = $"red bean"
@onready var tapioca: Sprite2D = $tapioca
@onready var popping_pearls: Sprite2D = $"popping pearls"

const COCONUT_JELLY_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/coconut_jelly_cup.png")
const LYCHEE_JELLY_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/lychee_jelly_cup.png")
const MANGO_POPPING_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/mango_popping_cup.png")
const MILK_FOAM_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/milk_foam_cup.png")
const POPPING_PEARL_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/popping_pearl_cup.png")
const RED_BEAN_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/red_bean_cup.png")
const TAPIOCA_CUP = preload("res://sprites/kitchen/toppings - dispenser/toppings drag/tapioca_cup.png")

#sprite for the topping that follows mouse
@onready var topping_drag: Sprite2D = $"../toppingDrag"

@onready var area_2d: Area2D = $"../toppingDrag/Area2D"
@onready var collision_shape_2d: CollisionShape2D = $"../toppingDrag/Area2D/CollisionShape2D"

var toppingFollowMouse = false
var toppingFollowCup = false

var newInstanceFollowMouse = false
var newInstanceFollowCup = false

var toppingPosition
var resetTopping = false

var newInstance = false
var newArea2D: Area2D 
var newCollisionShape2D: CollisionShape2D

var toppingInstance

#arrays for different sprite arrays
var unlockedToppings

var totalToppings = []

var unlockedToppingsCup = [LYCHEE_JELLY_CUP,COCONUT_JELLY_CUP,MANGO_POPPING_CUP,MILK_FOAM_CUP,RED_BEAN_CUP,TAPIOCA_CUP,POPPING_PEARL_CUP]
var totalToppingsCup = []

var unlockedToppingsSprites = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.toppingInCup.connect(toppingInCup)
		
		
		# Store the real Sprite2Ds for local use (mouse input)
	unlockedToppingsSprites = [lychee_jelly, coconut_jelly, mango_popping, milk_foam, red_bean, tapioca, popping_pearls]
	
	# Store just the texture paths for the global use
	unlockedToppings = []
	for topping in unlockedToppingsSprites:
		unlockedToppings.append(topping.texture.resource_path)

	
	#initialize topping array w sprites
	#very important for this to be here don't move it!
	#unlockedToppings = [lychee_jelly,coconut_jelly,mango_popping,milk_foam,red_bean,tapioca,popping_pearls]
	

	# Set the global unlocked drinks array
	SignalBus.unlockedToppings = unlockedToppings
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(toppingFollowMouse):
		topping_drag.position = get_global_mouse_position()
		
	if(newInstanceFollowMouse):
		toppingInstance.position = get_global_mouse_position()
		
	if(toppingFollowCup):
		topping_drag.position = toppingPosition
		
	if(newInstanceFollowCup):
		toppingInstance.position = toppingPosition
		
func _input(event: InputEvent) -> void:
	#for loop that loops through array of toppings
	if(Input.is_action_just_pressed("mouse click")):
		#for topping in range(unlockedToppings.size()):
			#var currentTopping
			#currentTopping = unlockedToppings[topping]
		for topping in range(unlockedToppingsSprites.size()):
			var currentTopping = unlockedToppingsSprites[topping]

			var mousePos = get_global_mouse_position()
			#gets mouse position local to specific sprite looking at
			var local_mouse_pos = currentTopping.to_local(mousePos)
		
			#basically saying if the mouse is within the rect 
			if(currentTopping.get_rect().has_point(local_mouse_pos)):
				toppingFollowMouse = true 

				#if the topping is in the cup when the jar is clicked, reset back to mouse
				if(toppingFollowCup && newInstance == false):
					toppingFollowMouse = true
					toppingFollowCup = false
					newInstance = true
					newInstanceFollowMouse = true
					
					toppingInstance = topping_drag.duplicate()
					newArea2D = area_2d.duplicate()
					add_child(toppingInstance)	
					toppingInstance.position = get_global_mouse_position()
					toppingInstance.get_child(0).add_to_group("newInstanceTopping")
					toppingInstance.get_child(0).remove_from_group("topping")
					
				if(newInstance == false):
					topping_drag.texture = unlockedToppingsCup[topping]
				else:
					toppingInstance.texture = unlockedToppingsCup[topping]
						
func toppingInCup(cupPositon,newInstanceInCup):
	toppingFollowCup = true
	toppingFollowMouse = false		
	
	toppingPosition = cupPositon
	
	if(newInstanceInCup):
		newInstanceFollowCup = true
		newInstanceFollowMouse = false
