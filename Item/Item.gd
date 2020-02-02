extends KinematicBody

signal item_enter
signal item_exit

var player

var can_be_picked_up = false
var main

func _ready():
	player = get_parent().get_node("Player")
	main = get_parent()
	
	connect("item_enter", main, "_on_Item_item_enter")
	connect("item_exit", main, "_on_Item_item_exit")
	
	player.connect("pick_up", self,"_on_Item_picked_up")
	
	add_to_group("items")
	

func _on_Area_body_entered(body):
	emit_signal("item_enter")
	can_be_picked_up = true

	
func _on_Area_body_exited(body):
	emit_signal("item_exit")
	can_be_picked_up = false
	
func _on_Item_picked_up():
	if can_be_picked_up:
		main.held_item = self
