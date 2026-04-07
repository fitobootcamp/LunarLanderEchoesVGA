extends Control

var tween :Tween
@onready var arraybuttons : Array [Control]  = [$button2,$button,$button3,$button4]
func _ready() -> void:
	$greeb1.self_modulate = Color(1.0, 1.0, 1.0, 0.0)
	$Sprite2D.self_modulate = Color(1.495, 0.694, 0.0, 0.0)
	print(arraybuttons)
	for i in arraybuttons:
		i.modulate = Color(1.0, 1.0, 1.0, 0.0)
	$modedisplay.modulate =Color(1.0, 1.0, 1.0, 0.0)
	animation()
	pass

func animation():
	tween = create_tween()
	
	tween.tween_property($greeb1,"self_modulate",Color(1.0, 1.0, 1.0, 1.0),.5)
	tween.tween_property($Sprite2D,"self_modulate",Color(1.495, 0.694, 0.0, 1.0),.5)
	tween.tween_property($modedisplay,"modulate",Color(1.495, 0.907, 0.0, 1.0),.5)
	for i in arraybuttons:
		tween.tween_property(i,"modulate",Color(1.0, 1.0, 1.0, 1.0),.2)
	
