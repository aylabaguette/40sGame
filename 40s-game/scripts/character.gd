extends Node2D

# Called when the node enters the scene tree for the first time
@onready var emily: Sprite2D = $"../Emily"
@onready var kyrat: Sprite2D = $"../Kyrat"
@onready var momo: Sprite2D = $"../Momo"
@onready var bob_ferguson: Sprite2D = $"../BobFerguson"
@onready var mabel: Sprite2D = $"../Mabel"


func _ready() -> void: 
	randomCharacter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to show one random character when it shows the shop screen
func randomCharacter():
	# Declare the list of character sprite paths
	#var Emily = 
	#var Kyrat = $"../Character sprites/Kyrat"
	#var Momo = $"../Character sprites/Momo"
	#var BobFerguson = $"../Character sprites/BobFerguson"
	#var Mabel = $"../Character sprites/Mabel"
	
	#sets the visibility of the characters to not visible
	emily.visible = false
	kyrat.visible = false
	momo.visible = false
	bob_ferguson.visible = false
	mabel.visible = false
	
	#array for the character sprites!!
	var characterSprites = [emily, kyrat, momo, bob_ferguson, mabel]
	
	# Picks a random character sprite from the list and sets its visibility to visible
	#can change this code later on so that the characters show up in the order decided to match the story line?
	#or however we decide to have the characrters show up order wise/randomized or not?
	var selectedSprite = characterSprites[randi() % characterSprites.size()]
	selectedSprite.visible = true
