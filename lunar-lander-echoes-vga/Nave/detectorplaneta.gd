extends RayCast3D

func _physics_process(delta: float) -> void:
	print(get_collision_point())
	
