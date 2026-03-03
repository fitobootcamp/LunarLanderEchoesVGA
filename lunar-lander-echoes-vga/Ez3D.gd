@tool
extends Node3D
class_name ez3d
var light = DirectionalLight3D.new()
var camera = Camera3D.new()
var enviroment = WorldEnvironment.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dueño = get_tree().edited_scene_root
	if dueño.has_node("ez3dcamera"):
		queue_free()
		print("Ya usaste ez3d")
		return
	
	
	camera.name= "ez3dcamera"
	dueño.add_child(camera)
	camera.owner= dueño
	
	light.name= "ez3dlight"
	dueño.add_child(light)
	light.owner= dueño
	
	enviroment.name= "ez3denviroment"	
	dueño.add_child(enviroment)
	enviroment.owner= dueño
	
	queue_free()
