extends KinematicBody

signal item_enter
signal item_exit

func _ready():
	var player = get_parent().get_node("Player")
	player.connect("item_enter", player, "_on_Item_item_enter")
	player.connect("item_exit", player, "_on_Item_item_exit")
	
	add_to_group("items")

func _on_Area_body_entered(body):
	emit_signal("item_enter")

func _on_Area_body_exited(body):
	emit_signal("item_exit")
