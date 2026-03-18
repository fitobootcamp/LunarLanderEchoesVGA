extends Node3D
var looker : Vector3

func _physics_process(delta: float) -> void:
			
	var vector = $"../Nave".position
	var rads = atan2(vector.x,vector.y)
	rotation.z = rads*-1
	##print(rads,rotation.z)
	##print(delta)
	##print(vector)
#func _process(delta: float) -> void:
	#print(delta)
