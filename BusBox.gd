extends Area


export var bus_name = "Nerd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BusBox_area_entered(area):
	print(area.get_parent().name)
	
	var item = area.get_parent()
	
	var track = item.get_node("Track")
	track.bus = bus_name
	
