extends Spatial

var held_item

func _physics_process(delta):
		if $Player.holding_item:
		   held_item.global_transform = $Player/ItemPosition.global_transform 

func _on_Player_pick_up():
	$Player/ItemPosition.add_child(held_item)

func _on_Player_put_down():
	$Player/ItemPosition.remove_child(held_item)
	held_item.translate(Vector3(0,-3,0))

func _on_Item_item_enter():
	$Player.can_pick_up = true

func _on_Item_item_exit():
	$Player.can_pick_up = false
