extends Node2D

# Called when the node enters the scene tree for the first time
func _ready() -> void: 
	randomCharacter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to show one random character when it shows the shop screen
func randomCharacter():
	# Declare the list of character sprite paths
	var Emily = $"../Character sprites/Emily"
	var Kyrat = $"../Character sprites/Kyrat"
	var Momo = $"../Character sprites/Momo"
	var BobFerguson = $"../Character sprites/BobFerguson"
	var Mabel = $"../Character sprites/Mabel"
	
	#sets the visibility of the characters to not visible
	Emily.visible = false
	Kyrat.visible = false
	Momo.visible = false
	BobFerguson.visible = false
	Mabel.visible = false
	
	#array for the character sprites!!
	var characterSprites = [Emily, Kyrat, Momo, BobFerguson, Mabel]
	
	# Picks a random character sprite from the list and sets its visibility to visible
	#can change this code later on so that the characters show up in the order decided to match the story line?
	#or however we decide to have the characrters show up order wise/randomized or not?
	var selectedSprite = characterSprites[randi() % characterSprites.size()]
	selectedSprite.visible = true
