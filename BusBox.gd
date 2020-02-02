extends Area


export var bus_name = "Nerd"

var last_bus

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_BusBox_area_entered(area):
	pass
	#print(area.get_parent().name + "from box")

	#var item = area.get_parent()	
	#var track = item.get_node("Track")
	#last_bus = track.bus
	#track.bus = bus_name
	


func _on_BusBox_area_exited(area):
	pass
	#var item = area.get_parent()
	#var track = item.get_node("Track")
	
	
