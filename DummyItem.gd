extends KinematicBody

signal item_enter
signal item_exit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area_body_entered(body):
	emit_signal("item_enter")
	print("entered")


func _on_Area_body_exited(body):
	emit_signal("item_exit")
	print("exited")
