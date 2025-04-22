extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."
@onready var image: TextureRect = $Panel/image
@onready var label: Label = $Panel/Label
@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#access the global variables
	var toppings = SignalBus.unlockedToppings
	var drinks = SignalBus.unlockedDrinks
	
	#will have to change this variabel to be the randomized toppings that are picked!!??
	var toppingSelected = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	var message = "order text here!"
	setBubble(toppingSelected, message)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setBubble(image_path: String, order: String)-> void:
	#portrait.texture = load(image_path)
	#text_label.text = dialogue_text
	var texture = load(image_path)
	image.texture = texture
	label.text = order
