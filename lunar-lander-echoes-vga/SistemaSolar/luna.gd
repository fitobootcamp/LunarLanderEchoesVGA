extends Planeta
class_name Luna
var ParentGrav

func _ready() -> void:
	
	#ActiveMesh = $lunamesh
	Tamaño= randf_range(0.25,.35)
	mates()
	if self is Luna:
		print("luna",Tamaño)
	
	$lunamesh.scale = Vector3 (Tamaño,Tamaño,Tamaño)
	material()
func luna():
	pass
func mates():
	GravSc = ParentGrav*.9
	pass
