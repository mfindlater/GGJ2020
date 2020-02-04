extends Area

signal clear

export var room_tag = ""
export var clear_amount = 3

var matching_items = 0

func _ready():
	add_to_group("room")
	var main = get_parent()
	connect("clear",main,"_on_Room_clear")
	

func _on_Room_body_entered(body):
	
	var tag = body.get_meta("tag")
	
	if tag != null and tag == room_tag:
		matching_items += 1
		print("matching items: " + str(matching_items))
		
		if matching_items >= clear_amount:
			print("cleared room")
			emit_signal("clear",room_tag)

func _on_Room_body_exited(body):
	if body.has_meta("tag") and body.get_meta("tag") == room_tag:
		matching_items -= 1
		print("matching item returned to player")
