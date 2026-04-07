extends Label


func _on_button_2_mouse_entered() -> void:
	print("hola")
	greebletext($"../button2")
	pass # Replace with function body.


func _on_button_3_mouse_entered() -> void:
	print("hola")
	greebletext($"../button3")
	pass # Replace with function body.


func _on_button_mouse_entered() -> void:
	print("hola")
	greebletext($"../button")
	pass # Replace with function body.

func greebletext(_button: Button):
	text = str(_button.get_instance_id())
	print(_button.get_instance_id())


func _on_button_hovering(_instid: Variant) -> void:
	text = String.num_int64(_instid, 16)
	print(_instid)
	pass # Replace with function body.
