extends KinematicBody

signal item_enter
signal item_exit

func _ready():
	add_to_group("items")

func _on_Area_body_entered(body):
	emit_signal("item_enter")

func _on_Area_body_exited(body):
	emit_signal("item_exit")
