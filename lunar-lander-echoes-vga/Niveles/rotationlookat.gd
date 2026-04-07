extends Node3D


func _physics_process(delta: float) -> void:
	
	var vector = $"../../Nave".global_position
	var rads = atan2(vector.x,vector.y)
	rotation.z = rads*-1
