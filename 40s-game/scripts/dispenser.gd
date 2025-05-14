extends Node2D

#preload pngs for drink options symbol
const BROWN_SUGAR = preload("res://sprites/kitchen/toppings - dispenser/brown sugar.PNG")
const COFFEE = preload("res://sprites/kitchen/toppings - dispenser/coffee.PNG")
const LEMON = preload("res://sprites/kitchen/toppings - dispenser/lemon.PNG")
const MANGO = preload("res://sprites/kitchen/toppings - dispenser/mango.PNG")
const MATCHA = preload("res://sprites/kitchen/toppings - dispenser/matcha.PNG")
const PASSION_FRUIT = preload("res://sprites/kitchen/toppings - dispenser/passion fruit.PNG")

#preload pngs for drink options liquid
const BROWNSUGAR_LIQUID = preload("res://sprites/kitchen/Liquid/brownsugarLiquid.png")
const COFFEE_LIQUID = preload("res://sprites/kitchen/Liquid/coffeeLiquid.png")
const LEMON_LIQUID = preload("res://sprites/kitchen/Liquid/lemonLiquid.png")
const MANGO_LIQUID = preload("res://sprites/kitchen/Liquid/mangoLiquid.png")
const MATCHA_LIQUID = preload("res://sprites/kitchen/Liquid/matchaLiquid.png")
const PASSIONFRUIT_LIQUID = preload("res://sprites/kitchen/Liquid/passionfruitLiquid.png")

#reference to nodes
@onready var dispense_button: Button = $DispenseButton

@onready var drink_option: Sprite2D = $"Dispenser/Drink Option"

@onready var drink_liquid: Sprite2D = $"../Cup/drinkLiquid"

@onready var area_2d_cup: Area2D = $"../Cup/Area2DCup"

#holds the current drink option from the dispenser 
var currentDrinkOption = COFFEE
#true if cup is inside the dispenser area
var cupEntered = false 

#need to change these: arrays for drink options
var unlockedDrinks = [COFFEE,BROWN_SUGAR,LEMON,MANGO,MATCHA,PASSION_FRUIT]
var totalDrinks = []

var unlockedDrinksLiquid = [COFFEE_LIQUID,BROWNSUGAR_LIQUID,LEMON_LIQUID,MANGO_LIQUID,MATCHA_LIQUID,PASSIONFRUIT_LIQUID]
var totalDrinksLiquid = []

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
	
func _on_dispenser_area_area_entered(area: Area2D) -> void:
	#if the object that enters the dispenser area is a cup, then set true
	if area.is_in_group("cup"):
		cupEntered = true 
		
func _on_dispenser_area_area_exited(area: Area2D) -> void:
	#opposite 
	if area.is_in_group("cup"):
		cupEntered = false
		print(cupEntered)

func _on_dispense_button_pressed() -> void:
	if(cupEntered == true):
		#get the index of the current drink option, should be the same in both liquid and 
		#symbol arrays. then set the liquid sprite to that matching texture
		var drinkIndex = unlockedDrinks.find(currentDrinkOption)
		var liquidSprite = unlockedDrinksLiquid[drinkIndex]
		drink_liquid.texture = liquidSprite
		drink_liquid.visible = true 
