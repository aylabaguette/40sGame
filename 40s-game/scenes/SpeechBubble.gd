extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."
@onready var image: TextureRect = $Panel/image

@onready var image2: TextureRect = $Panel/image2
@onready var image3: TextureRect = $Panel/image3

@onready var label: Label = $Panel/Label
@onready var label2: Label = $Panel/Label2
@onready var label3: Label = $Panel/Label3
@onready var label4: Label = $Panel/Label4

@onready var panel: Panel = $Panel

#this was set in the inspector side bar thingy to the character node/character.gd
@export var characterManagerPath: NodePath


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#access the global variables
	var toppings = SignalBus.unlockedToppings
	var drinks = SignalBus.unlockedDrinks
	
	#gets the character manager node using the pat that was set in the inspector
	var characterManager = get_node(characterManagerPath)
	
	#connects the "characterEntered" signal from the character manager to this script
	characterManager.connect("characterEntered", Callable(self, "showSpeechBubble"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func getName(path: String) -> String:
	#this gets the name of the file!!
	var fileName = path.get_file().get_basename()  
	return fileName 
	

#this function sets the images and text of the speech bubble panel!
func setBubble(image_path: String, image_path2: String, image_path3: String, order1: String, order2: String, order3: String, order4: String)-> void:
	
	#loads textures from the given file paths!
	var texture = load(image_path)
	var texture2 = load(image_path2)
	var texture3 = load(image_path3)
	
	#assgins the textrues to the image spaces in the panel
	image.texture = texture
	image2.texture = texture2
	image3.texture = texture3
	
	#sets the text for the order!
	label.text = order1
	label2.text = order2
	label3.text = order3
	label4.text = order4
	

#this functions is called after the character walks in and shows the speech bubble w/ the order details!
func showSpeechBubble():
	
	#theses will be randomized later on
	var toppingSelected = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	var toppingSelected2 = "res://sprites/kitchen/toppings - dispenser/coffee.PNG"
	var flavourSelected = "res://sprites/kitchen/toppings - dispenser/lemon.PNG"
	
	#get the names from the file paths!
	var topping1Name = getName(toppingSelected)
	var topping2Name = getName(toppingSelected2)
	var flavourName = getName(flavourSelected)
	
	var message1 = "I would like to order " + flavourName
	var message2 = " with " + topping1Name
	var message3 = " and " + topping2Name
	var message4 = " please!"
	
	#fills in the speech bubble visuals and shows the actual panel?!
	setBubble(toppingSelected, toppingSelected2, flavourSelected, message1, message2, message3, message4)
	panel.visible = true
