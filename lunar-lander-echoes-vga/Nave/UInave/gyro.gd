extends Node3D

@export var navebody: Nave
@export var lookatnode : Node3D
@onready var material = $MeshInstance3D.get_active_material(0)
var blap
var luzvar
func _physics_process(delta: float) -> void:
	#rotate_object_local(Vector3.UP, 1 * delta)
	#$MeshInstance3D.rotation.y += 1 *delta
	material.uv1_offset.x += .1*delta
	$MeshInstance3D.rotation.z = (navebody.rotation.z - lookatnode.rotation.z) 
	blap = lookatnode.rotation.z
	luzvar = 1-(absf((blap)/PI))
	#print(luzvar)
	$"../../ez3dlight".miluz(luzvar)
	$"../../ez3denviroment".mimulti(luzvar)
