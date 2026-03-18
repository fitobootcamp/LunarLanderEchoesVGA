extends Control

@export var navebody : Nave
var velocidat
var colorcito = Color(0.0, 0.0, 0.0, 1.0)
var gradiente : Gradient
var gradpercet 
var gravmax 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravmax = Globals.migravedad * 9.8
	gradiente = Gradient.new()
	gradiente.offsets = PackedFloat32Array([0.2,0.4,0.9])
	gradiente.colors = PackedColorArray([Color(0.0, 1.0, 0.0, 1.0),Color(1.0, 1.0, 0.0, 1.0),Color(1.0, 0.0, 0.0, 1.0)])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(absi(navebody.linear_velocity.y))
	#con esto eligo un rango de la gradiente, 0 es la velocidad minima y gravmax la velocidad terminal maxima
	gradpercet = inverse_lerp(0,absi(gravmax),absi(navebody.linear_velocity.y))
	print(gradiente.sample(gradpercet))
	$Label.text = str(absi(navebody.linear_velocity.y))
	$Label.add_theme_color_override("font_color", Color(gradiente.sample(gradpercet)))
	#$ColorRect.color = gradiente.sample(gradpercet)
	#if navebody != null:
		#velocidat = absi(navebody.linear_velocity.y)
		#if velocidat <= 3:
			#$Label.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		#else:
			#$Label.add_theme_color_override("font_color",Color(1.0, 0.0, 0.0, 1.0))
		#$Label.text = str(velocidat)
		#
		#
		#print(velocidat)
	pass
