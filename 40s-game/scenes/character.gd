extends Node2D

# Called when the node enters the scene tree for the first time
# Initialize and declare the list of character sprite paths
@onready var emily: Sprite2D = $"../Emily"
@onready var kyrat: Sprite2D = $"../Kyrat"
@onready var momo: Sprite2D = $"../Momo"
@onready var bob_ferguson: Sprite2D = $"../BobFerguson"
@onready var mabel: Sprite2D = $"../Mabel"

#signal to connect character entering the shop and the speech bubble!
signal characterEntered
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void: 
	randomCharacter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to show one random character when it shows the shop screen
func randomCharacter():
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
	
	#wait a bit before moving 
	await get_tree().create_timer(1).timeout
	
	#the "animation" part so the character appears and then moves behind the counter
	var startPosition = selectedSprite.position
	var endPosition = startPosition + Vector2(350, 10)
	
	#tween lets you do the actual animation stuff...!?
	var tween = create_tween()
	
	#moves the selectedSprit.position to endPosition over 1.5 seconds
	tween.tween_property(selectedSprite, "position", endPosition, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	#"calls back" to the character entering and that it has happened
	tween.tween_callback(Callable(self, "onCharacterEntered"))
	

func onCharacterEntered():
	#sends the signal!!
	emit_signal("characterEntered")
