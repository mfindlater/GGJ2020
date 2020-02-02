extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	get_parent().get_child(0).hide()
	get_parent().get_child(1).hide()
	get_parent().get_child(2).hide()
	get_parent().get_child(3).hide()
	get_parent().get_child(4).hide()
	get_parent().get_child(5).hide()
