extends Node2D

@onready var text_label: Label = $Panel/Label  # Reference to the Label node
@onready var speechBubble: Node2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var message = "Order Here?!"
	#Show the speech bubble with the message
	speechBubble.setBubble(message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setBubble(text: String) -> void:
	text_label.text = text  # Set the text in the Label
