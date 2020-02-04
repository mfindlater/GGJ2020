extends StaticBody

export var tag = ""

var anim = "IdleLoop"

func _ready():
	add_to_group("kids")

func _process(delta):
	$Model/AnimationPlayer.current_animation = anim

func _on_CharacterRoom_cleared(room_tag):
	if tag == room_tag:
		anim = "Special"
