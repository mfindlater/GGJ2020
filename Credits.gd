extends Control

func _ready():
	hide()


func _on_Main_game_over():
	show()
	yield(get_tree().create_timer(30,false),"timeout")
	get_tree().change_scene("res://Menu.tscn") 
