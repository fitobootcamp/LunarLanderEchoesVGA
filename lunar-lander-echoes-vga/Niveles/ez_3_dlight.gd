extends DirectionalLight3D

#func _physics_process(delta: float) -> void:
	#if light_energy >=0:
		#$".".light_energy -= .5*delta
func miluz(_luzval):
	light_energy = _luzval
