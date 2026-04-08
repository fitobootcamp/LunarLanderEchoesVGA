extends Control

var tween :Tween
@onready var arraybuttons : Array [Control]  = [$button2,$button,$button3,$button4]
func _ready() -> void:
	reset()
	animation()
	pass
func reset():
	$greeb1.self_modulate = Color(1.0, 1.0, 1.0, 0.0)
	$Sprite2D.self_modulate = Color(1.495, 0.694, 0.0, 0.0)
	
	for i in arraybuttons:
		i.modulate = Color(1.0, 1.0, 1.0, 0.0)
	$modedisplay.modulate =Color(1.0, 1.0, 1.0, 0.0)
	$Label.self_modulate =Color(1.0, 1.0, 1.0, 0.0)
	$Label2.self_modulate =Color(1.0, 1.0, 1.0, 0.0)
	
func animation():
	tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property($greeb1,"self_modulate",Color(1.0, 1.0, 1.0, 1.0),.6)
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.parallel().tween_property($Panel/Label3,"position",Vector2(1,-600),1).set_delay(.2)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property($Sprite2D,"self_modulate",Color(1.495, 0.694, 0.0, 1.0),.5)	
	tween.tween_property($modedisplay,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.5)	
	
	
	for i in arraybuttons:
		tween.tween_property(i,"modulate",Color(1.0, 1.0, 1.0, 1.0),.3)
	tween.set_parallel()
	tween.tween_property($Label,"self_modulate",Color(1.0, 1.0, 1.0, 1.0),.5)
	tween.tween_property($Label2,"self_modulate",Color(1.0, 1.0, 1.0, 1.0),1)
