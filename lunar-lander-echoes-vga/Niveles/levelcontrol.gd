extends Node3D


func _on_area_3d_body_exited(body: Node3D) -> void:
	
	get_tree().call_deferred("change_scene_to_file","res://Niveles/nivel_0travel.tscn")
	pass # Replace with function body.
