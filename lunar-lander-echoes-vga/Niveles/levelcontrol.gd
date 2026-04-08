extends Node3D


func _on_area_3d_body_exited(body: Node3D) -> void:
	#print("bodypos",body.global_position)
	if body.global_position.y>45:
		get_tree().call_deferred("change_scene_to_file","res://Niveles/nivel_0travel.tscn")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == Key.KEY_ESCAPE:
			$CanvasLayer/SubViewportContainer.visible = true
			get_tree().paused = true
