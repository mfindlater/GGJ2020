extends Area

func _ready():
	get_parent().show()
	
func _on_Wall_body_entered(body):
	if body.has_meta("player"):
		get_parent().hide()

func _on_Wall_body_exited(body):
	if body.has_meta("player"):
		get_parent().show()
