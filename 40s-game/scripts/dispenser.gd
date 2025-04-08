extends Node2D

#preload pngs for drink options
const BROWN_SUGAR = preload("res://sprites/kitchen/toppings - dispenser/brown sugar.PNG")
const COFFEE = preload("res://sprites/kitchen/toppings - dispenser/coffee.PNG")
const LEMON = preload("res://sprites/kitchen/toppings - dispenser/lemon.PNG")
const MANGO = preload("res://sprites/kitchen/toppings - dispenser/mango.PNG")
const MATCHA = preload("res://sprites/kitchen/toppings - dispenser/matcha.PNG")
const PASSION_FRUIT = preload("res://sprites/kitchen/toppings - dispenser/passion fruit.PNG")

#reference to sprite drink option: holds the pngs of drinks 
@onready var drink_option: Sprite2D = $"Dispenser/Drink Option"
var currentDrinkOption = COFFEE

#need to change these: arrays for drink options
var unlockedDrinks = [COFFEE,BROWN_SUGAR,LEMON,MANGO,MATCHA,PASSION_FRUIT]
var totalDrinks = []

var unlockedToppings = []
var totalToppings = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get reference to signal levelledUp
	SignalBus.levelledUp.connect(onLevelUp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	drink_option.texture = currentDrinkOption

#called when the signal level up is emitted 
func onLevelUp(newLevel):
	print(newLevel)
	


func _on_left_button_pressed() -> void:
	#same as other just for left
	print("button working")
	var arrayIndex = unlockedDrinks.find(currentDrinkOption)
	if(arrayIndex == 0):
		arrayIndex = unlockedDrinks.size()-1
	else:
		arrayIndex = arrayIndex-1
	currentDrinkOption = unlockedDrinks[arrayIndex]

func _on_rightbutton_pressed() -> void:
		#get which item is "current topping"
	#if right, go to +1 and if left, go -1
	#check if item is first or last, then go to begining/end if so
	var arrayIndex = unlockedDrinks.find(currentDrinkOption)
	if(arrayIndex == unlockedDrinks.size()-1):
		currentDrinkOption = unlockedDrinks[0]
	else:
		currentDrinkOption = unlockedDrinks[arrayIndex+1]


func _on_dispenser_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
