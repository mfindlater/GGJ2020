extends KinematicBody

signal item_enter
signal item_exit

var player

var can_be_picked_up = false
var main

export var tag = ""

func _ready():
	player = get_parent().get_node("Player")
	main = get_parent()
	
	connect("item_enter", main, "_on_Item_item_enter")
	connect("item_exit", main, "_on_Item_item_exit")
	
	player.connect("pick_up", self,"_on_Item_picked_up")
	player.connect("put_down", self,"_on_Item_put_down")
	
	yield(get_tree().create_timer(0.5,false),"timeout")
	can_be_picked_up = false
	emit_signal("item_exit",name)
	
	set_meta("tag",tag)
	
	$Track.bus = "MusicAmbient"

func _on_Area_body_entered(body):
	emit_signal("item_enter",name)
	can_be_picked_up = true
	print("entered")

	
func _on_Area_body_exited(body):
	emit_signal("item_exit",name)
	can_be_picked_up = false
	print("exited")
	
func _on_Item_picked_up():
	if can_be_picked_up:
		main.held_item = self
		$Track.bus = "MusicPickedUp"
		
func _on_Item_put_down():
	$Track.bus = "MusicAmbient"
