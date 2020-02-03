extends Control


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("ui_accept"):
		for child in get_children() :
			child.hide()

