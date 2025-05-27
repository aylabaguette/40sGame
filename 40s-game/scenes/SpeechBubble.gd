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
	
	#connects the "characterEntered" signal from the character manager to this script's "showSpeechBubble" thingy
	#characterManager.connect("characterEntered", Callable(self, "showSpeechBubble"))
	if not characterManager.is_connected("characterEntered", Callable(self, "showSpeechBubble")):
		characterManager.connect("characterEntered", Callable(self, "showSpeechBubble"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func getName(path: String) -> String:
	#this gets the name of the file!!
	var fileName = path.get_file().get_basename()  
	return fileName 
	

	# This function sets the images and text in the speech bubble
func setBubble(image_path: String, image_path2: String, image_path3: String, order1: String, order2: String, order3: String, order4: String) -> void:
	
	#the panel starts hidden and once the function is called it becomes visible
	panel.visible = true
	
	#the text and images start "blank" and then after waiting are set to the actual order to apear on screen line by line
	label.text = ""
	label2.text = ""
	label3.text = ""
	label4.text = ""
	
	image.texture = null
	image2.texture = null
	image3.texture = null
	
	image.visible = false
	image2.visible = false
	image3.visible = false

	# this is the line by line "appearing" of the text and images...
	label.text = order1
	image.texture = load(image_path)
	image.visible = true
	#this line is the "waiting"/timing thingy
	await get_tree().create_timer(1).timeout

	label2.text = order2
	image2.texture = load(image_path2)
	image2.visible = true
	await get_tree().create_timer(1).timeout

	label3.text = order3
	image3.texture = load(image_path3)
	image3.visible = true
	await get_tree().create_timer(1).timeout

	label4.text = order4
func showSpeechBubble():
	var toppings_array = SignalBus.unlockedToppings.duplicate()
	toppings_array.shuffle()
	
	if toppings_array.size() < 2:
		push_error("❌ Not enough toppings unlocked to show two random toppings.")
		return
	
	var toppingSelected = toppings_array[0]
	var toppingSelected2 = toppings_array[1]
	
	# ✅ Randomize flavour from unlocked drinks
	var drinks_array = SignalBus.unlockedDrinks.duplicate()
	drinks_array.shuffle()
	
	if drinks_array.size() < 1:
		push_error("❌ No drinks unlocked.")
		return
	
	var flavourSelected = drinks_array[0]

	# ✅ Debug prints
	print("🥤 Random Flavour Selected: ", flavourSelected)
	print("🍧 Topping 1 Selected: ", toppingSelected)
	print("🍧 Topping 2 Selected: ", toppingSelected2)
	
	# Get file names from paths
	var topping1Name = getName(toppingSelected)
	var topping2Name = getName(toppingSelected2)
	var flavourName = getName(flavourSelected.resource_path)

	
	var message1 = "I would like to order " + flavourName
	var message2 = " with " + topping1Name
	var message3 = " and " + topping2Name
	var message4 = " please!"
	
	# Print final message
	print("🗨️ Full Message: ", message1, " ", message2, " ", message3, " ", message4)
	
	setBubble(flavourSelected.resource_path, toppingSelected, toppingSelected2, message1, message2, message3, message4)
	panel.visible = true








#MY VERSION OF THE CODE!!


#extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."
#@onready var image: TextureRect = $Panel/image

#@onready var image2: TextureRect = $Panel/image2
#@onready var image3: TextureRect = $Panel/image3

#@onready var label: Label = $Panel/Label
#@onready var label2: Label = $Panel/Label2
#@onready var label3: Label = $Panel/Label3
#@onready var label4: Label = $Panel/Label4

#@onready var panel: Panel = $Panel

#this was set in the inspector side bar thingy to the character node/character.gd
#@export var characterManagerPath: NodePath


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#access the global variables
#	var toppings = SignalBus.unlockedToppings
#	var drinks = SignalBus.unlockedDrinks
	
	#gets the character manager node using the pat that was set in the inspector
#	var characterManager = get_node(characterManagerPath)
	
	#connects the "characterEntered" signal from the character manager to this script's "showSpeechBubble" thingy
#	characterManager.connect("characterEntered", Callable(self, "showSpeechBubble"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
	
	
#func getName(path: String) -> String:
	#this gets the name of the file!!
#	var fileName = path.get_file().get_basename()  
#	return fileName 
	

	# This function sets the images and text in the speech bubble
#func setBubble(image_path: String, image_path2: String, image_path3: String, order1: String, order2: String, order3: String, order4: String) -> void:
	
	#the panel starts hidden and once the function is called it becomes visible
#	panel.visible = true
	
	#the text and images start "blank" and then after waiting are set to the actual order to apear on screen line by line
#	label.text = ""
#	label2.text = ""
#	label3.text = ""
#	label4.text = ""
	
#	image.texture = null
#	image2.texture = null
#	image3.texture = null
	
#	image.visible = false
#	image2.visible = false
#	image3.visible = false

	# this is the line by line "appearing" of the text and images...
#	label.text = order1
#	image.texture = load(image_path)
#	image.visible = true
#	#this line is the "waiting"/timing thingy
#	await get_tree().create_timer(1).timeout

#	label2.text = order2
#	image2.texture = load(image_path2)
#	image2.visible = true
#	await get_tree().create_timer(1).timeout

#	label3.text = order3
#	image3.texture = load(image_path3)
#	image3.visible = true
#	await get_tree().create_timer(1).timeout

#	label4.text = order4




#this functions is called after the character walks in and shows the speech bubble w/ the order details!
#func showSpeechBubble():
	
	#theses will be randomized later on
#	var toppingSelected = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
#	var toppingSelected2 = "res://sprites/kitchen/toppings - dispenser/coffee.PNG"
#	var flavourSelected = "res://sprites/kitchen/toppings - dispenser/lemon.PNG"
	
	#get the names from the file paths!
#	var topping1Name = getName(toppingSelected)
#	var topping2Name = getName(toppingSelected2)
#	var flavourName = getName(flavourSelected)
	
#	var message1 = "I would like to order " + flavourName
#	var message2 = " with " + topping1Name
#	var message3 = " and " + topping2Name
#	var message4 = " please!"
	
	#fills in the speech bubble visuals and shows the actual panel?!
#	setBubble(flavourSelected, toppingSelected, toppingSelected2, message1, message2, message3, message4)
#	panel.visible = true
