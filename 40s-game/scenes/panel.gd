extends Panel

func _ready():
	panel_style()


func panel_style():
	var style = StyleBoxFlat.new()
	
	#Select background and border colour
	style.bg_color = Color("#ffc0cb")      
	style.border_color = Color("#597357")    

	#create a border
	style.set_border_width(SIDE_LEFT, 4)
	style.set_border_width(SIDE_TOP, 4)
	style.set_border_width(SIDE_RIGHT, 4)
	style.set_border_width(SIDE_BOTTOM, 4)

	#make the edges round
	style.set_corner_radius(CORNER_TOP_LEFT, 12)
	style.set_corner_radius(CORNER_TOP_RIGHT, 12)
	style.set_corner_radius(CORNER_BOTTOM_LEFT, 12)
	style.set_corner_radius(CORNER_BOTTOM_RIGHT, 12)

	add_theme_stylebox_override("panel", style)
