extends Control

var off = true

#@onready var functions = [sceneloader(),funccaller()]
var tween
var coloron = Color(0.443, 1.0, 1.0, 1.0)
var coloroff = Color(0.086, 0.208, 0.196)
signal hovering(_instid)
signal clicked(_origin)
#func _ready() -> void:
	#$arrow/Label.text =buttontext
func buttontexter(_buttonname):
	$arrow/Label.text = _buttonname
func _on_arrow_mouse_entered() -> void:
	hovering.emit(get_instance_id())
	$hex.self_modulate = coloron
	
	%sfx.play()
	pass # Replace with function body.


func _on_arrow_mouse_exited() -> void:
	$hex.self_modulate = coloroff
	pass # Replace with function body.


func _on_arrow_pressed() -> void:
	tween = create_tween()
	tween.tween_property($arrow,"position", Vector2(46,$arrow.position.y),.1)
	tween.tween_callback(%sfx2.play)
	tween.tween_callback(miscolores)
	tween.tween_callback(funccaller).set_delay(.2)
	tween.tween_property($arrow,"position",Vector2(66,$arrow.position.y) ,.1)
	tween.tween_callback(miscolores)
	
		
	pass # Replace with function body.
func miscolores():
	if off:
		$arrow.self_modulate = coloron
		$connect.self_modulate = coloron
		$arrow/Label.add_theme_color_override("font_color", coloroff)
		$arrow/Label.horizontal_alignment =anchor_left
		
	else:
		$arrow.self_modulate = coloroff
		$connect.self_modulate = coloroff
		$arrow/Label.add_theme_color_override("font_color", coloron)
		$arrow/Label.horizontal_alignment =anchor_right
	off = not  off	
func funccaller():
	clicked.emit($arrow/Label.text)
	pass
