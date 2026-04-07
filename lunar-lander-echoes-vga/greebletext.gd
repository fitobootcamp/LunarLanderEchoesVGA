extends Label

func _physics_process(delta: float) -> void:
	text = str(get_local_mouse_position())
	text = String.num_int64(get_local_mouse_position().x,2)
