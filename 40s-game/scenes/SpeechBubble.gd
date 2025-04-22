extends Node2D

#@onready var label: Label = $Panel/Label # Reference to the Label node
#@onready var speechBubble: Node2D = $"."

@onready var portrait: TextureRect = $Panel/Portrait
@onready var text_label: Label = $Panel/Label
@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("portrait: ", portrait)
	print("text_label: ", text_label)
	var x = "res://sprites/kitchen/toppings - dispenser/brown sugar.PNG"
	var message = "Uhwefq!"
	set_speech(x, message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_speech(image_path: String, dialogue_text: String)-> void:
	#portrait.texture = load(image_path)
	#text_label.text = dialogue_text
	var tex = load(image_path)
	if tex:
		portrait.texture = tex
	else:
		push_error("Couldn't load image: " + image_path)
	text_label.text = dialogue_text
