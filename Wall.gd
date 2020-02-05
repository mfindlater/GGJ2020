extends Area

func _ready():
	get_parent().show()
	
func _on_Wall_body_entered(body):
	if body.has_meta("player"):
		get_parent().hide()
		
		var hiders = get_tree().get_nodes_in_group("hide")
		for hider in hiders:
			hider.hide()

func _on_Wall_body_exited(body):
	if body.has_meta("player"):
		get_parent().show()
		
		var hiders = get_tree().get_nodes_in_group("hide")
		for hider in hiders:
			hider.hide()
