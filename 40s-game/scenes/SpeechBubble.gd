extends Node2D

@onready var label: Label = $Panel/Label # Reference to the Label node
@onready var textureRect: TextureRect = $Panel/Label/TextureRect
@onready var speechBubble: Node2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Access the global variables!!
	var toppings = SignalBus.unlockedToppings
	var drinks = SignalBus.unlockedDrinks
	
	#var toppingPicked = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	#textureRect.texture = toppings
	#textureRect = toppingPicked
	#const BROWN_SUGAR = preload("res://sprites/kitchen/toppings - dispenser/brown sugar.PNG")
	#var message = toppings
	#textureRect.texture = BROWN_SUGAR
	
	#Show the speech bubble with the message
	#speechBubble.setBubble(message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setBubble(text: String) -> void:
	pass
	label.text = text  # Set the text in the Label
