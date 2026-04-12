extends Node3D

#func _physics_process(delta: float) -> void:
	#if $Planeta_interior/Nave.is_inside_tree():
		#print("vivo")
	#else:
		#print("muerto")
func _on_area_3d_body_exited(body: Node3D) -> void:
	#print("bodypos",body.global_position)
	print("saliendo")
	if body is Nave:
		
		get_tree().call_deferred("change_scene_to_file","res://Niveles/nivel_0travel.tscn")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == Key.KEY_ESCAPE:
			$CanvasLayer/SubViewportContainer.visible = true
			get_tree().paused = true


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Nave:
		print("dentro")
	pass # Replace with function body.
