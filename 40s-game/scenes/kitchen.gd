extends Node2D

#preload pngs for drink options
const COFFEE = preload("res://sprites/toppings/coffee.PNG")
const BROWN_SUGAR = preload("res://sprites/toppings/brown sugar.PNG")
const LEMON = preload("res://sprites/toppings/lemon.PNG")
const MANGO = preload("res://sprites/toppings/mango.PNG")
const MATCHA = preload("res://sprites/toppings/matcha.PNG")
const PASSION_FRUIT = preload("res://sprites/toppings/passion fruit.PNG")

#reference to sprite drink option: holds the pngs of drinks 
@onready var drink_option: Sprite2D = $"Node2D/Drink Option"
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
	#set the sprite texture to the current drink option
	drink_option.texture = currentDrinkOption
	
#change scenes to shop when button pressed
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Shop.tscn")
	
#called when the signal level up is emitted 
func onLevelUp(newLevel):
	print(newLevel)

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
	#same as other just for left
	print("button working")
	var arrayIndex = unlockedDrinks.find(currentDrinkOption)
	if(arrayIndex == 0):
		arrayIndex = unlockedDrinks.size()-1
	else:
		arrayIndex = arrayIndex-1
	currentDrinkOption = unlockedDrinks[arrayIndex]
