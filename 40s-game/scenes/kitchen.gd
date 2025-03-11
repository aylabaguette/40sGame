extends Node2D

const COFFEE = preload("res://sprites/toppings/coffee.PNG")
const BROWN_SUGAR = preload("res://sprites/toppings/brown sugar.PNG")
const LEMON = preload("res://sprites/toppings/lemon.PNG")
const MANGO = preload("res://sprites/toppings/mango.PNG")
const MATCHA = preload("res://sprites/toppings/matcha.PNG")
const PASSION_FRUIT = preload("res://sprites/toppings/passion fruit.PNG")

@onready var drink_option: Sprite2D = $"Node2D/Drink Option"
var currentDrinkOption = COFFEE

#different arrays to have: total drinks & total toppings. unlocked drinks & unlocked toppings
#pick randomly from that array and add to other

#CHANGE LATER: TOO MANY DRINKS. 
var unlockedDrinks = [COFFEE,BROWN_SUGAR,LEMON,MANGO,MATCHA,PASSION_FRUIT]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	drink_option.texture = currentDrinkOption
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Shop.tscn")

func _on_rightbutton_pressed() -> void:
	#get which item is "current topping"
	#if right, go to +1 and if left, go -1
	#check if item is first or last, then go to begining/end if so
	var arrayIndex = unlockedDrinks.find(currentDrinkOption)
	if(arrayIndex == unlockedDrinks.size()-1):
		currentDrinkOption = unlockedDrinks[0]
	else:
		currentDrinkOption = unlockedDrinks[arrayIndex+1]

func _on_left_button_pressed() -> void:
	print("button working")
	var arrayIndex = unlockedDrinks.find(currentDrinkOption)
	if(arrayIndex == 0):
		currentDrinkOption = unlockedDrinks[unlockedDrinks.size()-1]
	else:
		currentDrinkOption = unlockedDrinks[arrayIndex-1]
