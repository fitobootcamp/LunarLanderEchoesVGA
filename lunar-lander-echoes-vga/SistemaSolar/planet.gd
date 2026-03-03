extends Node3D
class_name Planeta
var luna_count = randi_range(1,3)
var lunas = preload("res://SistemaSolar/luna.tscn")
var Tamaño
var GravSc 
@onready var ActiveMesh = get_child(0)
#func _physics_process(delta: float) -> void:
	#rotation.y = .5 *delta
		
	
func _ready() -> void:
	#if self is Planeta:
		#print("planeta")
	Tamaño= randf_range(6,15)
	
	ActiveMesh.scale = Vector3 (Tamaño,Tamaño,Tamaño)
	mates()	
	luna()
	material()
func luna():
	if self is Planeta:
		var grados
		if luna_count != 0:
			grados = 360 / luna_count
		
		for i in range(luna_count):
			var lunasinstance = lunas.instantiate()
			lunasinstance.position.z = (1) * sin(grados*i) + 0
			lunasinstance.position.x = (1) * cos(grados*i) + 0
			lunasinstance.ParentGrav = GravSc
			$planetmesh/RotacionLuna.add_child(lunasinstance)
			
			
		pass
func material():
	var original = ActiveMesh.get_active_material(0)
	
	var my_material = original.duplicate()
	#print(original)
	#print(my_material)
	my_material.albedo_color = Color(randf(), randf(), randf())
	ActiveMesh.set_surface_override_material(0, my_material)
	#print($planetmesh.get_active_material(0))
	
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Jugador"):
			
		body.gravity_scale = GravSc
		Globals.migravedad = GravSc
		Globals.colorplaneta = ActiveMesh.get_active_material(0).albedo_color
		#print(GravSc)
		#print("dentro")
		get_tree().call_deferred("change_scene_to_file","res://Niveles/nivel_1.tscn")
	pass # Replace with function body.
func planetui(_state):
	$MeshInstance3D.visible = _state
func mates():
	GravSc = 0 + (Tamaño - 6)*(2-0)/(15-6)

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Jugador"):
		print("afuera")
	pass # Replace with function body.
