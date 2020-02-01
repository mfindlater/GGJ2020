extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var material = SpatialMaterial.new()
	material = get_surface_material(0)
	material.albedo_color = Color(1,0,0)
	set_surface_material(0,material)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
