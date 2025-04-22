extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."
@onready var image: TextureRect = $Panel/image
@onready var label: Label = $Panel/Label
@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("portrait: ", portrait)
	#print("label: ", label)
	#will have to change this variabel to be the randomized toppings that are picked!!??
	var imageSelected = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	var message = "order text here!"
	set_speech(imageSelected, message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_speech(image: String, order: String)-> void:
	#portrait.texture = load(image_path)
	#text_label.text = dialogue_text
	var texture = load(image)
	if texture:
		image.texture = texture
	#else:
		#push_error("Couldn't load image: " + image_path)
	label.text = order
