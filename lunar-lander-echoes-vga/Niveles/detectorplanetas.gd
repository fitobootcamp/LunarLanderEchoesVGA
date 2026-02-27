extends Node3D




func _on_area_3d_area_entered(area: Area3D) -> void:
	
	$"../Sun".velocidadrotacion = 0.01
	pass # Replace with function body.


func _on_area_3d_area_exited(area: Area3D) -> void:
	$"../Sun".velocidadrotacion = 1
	pass # Replace with function body.
