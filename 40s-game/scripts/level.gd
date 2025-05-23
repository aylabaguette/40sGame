extends Label

var playerLevel = 1 
var playerXP = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	if(levelUp()) == true:
		#emits signal that level up occurred 
		SignalBus.levelledUp.emit(playerLevel)
	
#deals with levelling up when the right conditions are there
func levelUp():
	var upLevel = false 
	
	if(playerLevel == 1 && playerXP == 1):
		playerLevel+=1
		playerXP = 0
		upLevel = true
	elif(playerLevel ==2 && playerXP == 3):
		playerLevel+=1
		playerXP = 0
		upLevel = true
	elif(playerLevel ==3 && playerXP == 5):
		playerLevel+= 1
		playerXP = 0
		upLevel = true
	elif(playerLevel ==4 && playerXP == 7):
		playerLevel+= 1
		playerXP = 0
		upLevel = true
	elif(playerLevel ==5 && playerXP == 9):
		playerLevel+= 1
		playerXP = 0
		upLevel = true
		
	return upLevel
		
