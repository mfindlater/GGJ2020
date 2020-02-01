extends Spatial

func _ready():
	pass
func _process(delta):
	pass ##	$DummyItem.global_transform = $Player/ItemPosition.global_transform 

func _physics_process(delta):
		if $Player.holding_item:
		   $DummyItem.global_transform = $Player/ItemPosition.global_transform 

func _on_DummyItem_item_enter():
	$Player.can_pick_up = true
	

func _on_DummyItem_item_exit():
	$Player.can_pick_up = false

func _on_Player_pick_up():
	$Player/ItemPosition.add_child($DummyItem)
	AudioServer.set_bus_mute(2,false)
	#$Fade.interpolate_property($Nerd2,"volume_db",0, 1, 0.5)

func _on_Player_put_down():
	$Player/ItemPosition.remove_child($DummyItem)
	$DummyItem.translate(Vector3(0,-3,0))
	#$Fade.interpolate_property($Nerd2,"volume_db",1, 0, 0.5)
	AudioServer.set_bus_mute(2,true)
