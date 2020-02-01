extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if $Player.holding_item:
		$DummyItem.global_transform = $Player/ItemPosition.global_transform 
	
	 

func _on_DummyItem_item_enter():
	$Player.can_pick_up = true
	

func _on_DummyItem_item_exit():
	$Player.can_pick_up = false

func _on_Player_pick_up():
	
	$Player/ItemPosition.add_child($DummyItem)
	

func _on_Player_put_down():
	$Player/ItemPosition.remove_child($DummyItem)
	$DummyItem.translate(Vector3(0,-3,0))
