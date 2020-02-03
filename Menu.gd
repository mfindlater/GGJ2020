extends Control

onready var tween: Tween = get_node("Tween")
onready var stream: AudioStreamPlayer = get_node("MenuTheme")

var exiting = false

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and not exiting:
		tween.interpolate_property(stream, "volume_db",-10, -80,1,1, Tween.EASE_IN)
		tween.start()
		exiting = true

func _on_Tween_tween_completed(object, key):
	stream.stop()
	get_tree().change_scene("res://Main.tscn") 