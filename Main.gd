extends Spatial

signal game_over

var held_item

var room_clear_amount = 0
export var room_clear_goal = 4
var rooms_cleared = []

func _physics_process(delta):
		if $Player.holding_item:
		   held_item.global_transform = $Player/ItemPosition.global_transform 

func _on_Player_pick_up():
	pass

func _on_Player_put_down():
	held_item.translate(Vector3(0,-2.4,0))

func _on_Item_item_enter():
	$Player.can_pick_up = true

func _on_Item_item_exit():
	$Player.can_pick_up = false
	
func _on_Room_clear(room_tag):
	if rooms_cleared.has(room_tag) == false:
		room_clear_amount += 1
		rooms_cleared.append(room_tag)
		print("cleared " + room_tag + " room")
	
	if room_clear_amount == room_clear_goal:
		emit_signal("game_over")
		print("game over")
