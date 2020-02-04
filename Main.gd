extends Spatial

signal game_over

var held_item

var room_clear_amount = 0
export var room_clear_goal = 4
var rooms_cleared = []
var current_item_name = ""

func _physics_process(delta):
		if $Player.holding_item and held_item:
		   held_item.global_transform = $Player/ItemPosition.global_transform 

func _on_Player_pick_up():
	pass

func _on_Player_put_down():
	if held_item:
		held_item.translate(Vector3(0,-3.0,0))

func _on_Item_item_enter(item_name):
	$Player.can_pick_up = true
	current_item_name = item_name
	print("item: " + item_name)

func _on_Item_item_exit(item_name):
	$Player.can_pick_up = false
	print("item: " + item_name)
	
func _on_Room_clear(room_tag):
	if rooms_cleared.has(room_tag) == false:
		room_clear_amount += 1
		rooms_cleared.append(room_tag)
		print("cleared " + room_tag + " room")
	
	if room_clear_amount == room_clear_goal:
		emit_signal("game_over")
		print("game over")
