extends Node3D

var radioplaneta
var rebanadas
var circumfer
var plata = [preload("res://Niveles/Props/landing_base.tscn"),preload("res://Niveles/Props/landing_base_gris.tscn"),preload("res://Niveles/Props/obstaculo.tscn"),null]
var pesos = PackedFloat32Array ([10,20,20,50])
var rng = RandomNumberGenerator.new()
func _ready() -> void:
	radioplaneta = $planeta_circulo.mesh as CylinderMesh
	radioplaneta = radioplaneta.bottom_radius * 60
	circumfer = TAU * radioplaneta
	rebanadas = floor(circumfer/ 4)
	#print(rebanadas)
	
	for i in rebanadas:
		#if randf() < 0.25:
		var angulo = (TAU/ rebanadas)*i
		
		var x = cos(angulo) * (radioplaneta)
		var y = sin(angulo) * (radioplaneta)
		
		var pos = Vector3(x,y,0)
		
		var instanciable = plata[rng.rand_weighted(pesos)]
		#rand_weighted
		spwn(pos,angulo,instanciable)
	#var angulo = (TAU/ rebanadas) *1
func spwn(pos,angulo,insta):
	if insta == null:
		return
	var newinst = insta.instantiate()
	var heigh = randf_range(0,6)
	#print(angulo)
	newinst.position = pos + (Vector3(heigh,heigh,0)* pos.sign())
	newinst.rotation.z = angulo + deg_to_rad(-90)
	add_child(newinst)
	
	pass
	
