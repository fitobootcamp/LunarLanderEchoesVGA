extends Node3D
var Tamaño
var GravSc = randf_range(0,2.5)
func _ready() -> void:
	Tamaño= randf_range(6,15)
	
	$planetmesh.scale = Vector3 (Tamaño,Tamaño,Tamaño)
	material()

func material():
	var original = $planetmesh.get_active_material(0)
	
	var my_material = original.duplicate()
	#print(original)
	#print(my_material)
	my_material.albedo_color = Color(randf(), randf(), randf())
	$planetmesh.set_surface_override_material(0, my_material)
	#print($planetmesh.get_active_material(0))
	
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Jugador"):
		print(GravSc)
		print("dentro")
	pass # Replace with function body.


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Jugador"):
		print("afuera")
	pass # Replace with function body.
