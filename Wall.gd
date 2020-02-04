extends Area

func _ready():
	get_parent().show()
	
func _on_Wall_body_entered(body):
	get_parent().hide()

func _on_Wall_body_exited(body):
	get_parent().show()
