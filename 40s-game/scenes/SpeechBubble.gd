extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."
@onready var image: TextureRect = $Panel/image
@onready var label: Label = $Panel/Label
@onready var label2: Label = $Panel/Label2
@onready var label3: Label = $Panel/Label3
@onready var label4: Label = $Panel/Label4

@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#access the global variables
	var toppings = SignalBus.unlockedToppings
	var drinks = SignalBus.unlockedDrinks
	
	#will have to change this variabel to be the randomized toppings that are picked!!??
	var toppingSelected = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	#var message = "order text here!"
	#I woudl like to order _flavour_ (photo) with _topping1_ (photo) and _topping2_ (photo) pelase!
	var message1 = "I would like to order "
	var message2 = " with "
	var message3 = " and "
	var message4 = " please!"
	setBubble(toppingSelected, message1, message2, message3, message4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setBubble(image_path: String, order1: String, order2: String, order3: String, order4: String)-> void:
	var texture = load(image_path)
	image.texture = texture
	label.text = order1
	label2.text = order2
	label3.text = order3
	label4.text = order4
