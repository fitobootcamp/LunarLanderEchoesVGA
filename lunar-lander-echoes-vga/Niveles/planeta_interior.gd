extends Node3D

var radioplaneta
var rebanadas
var circumfer
var plata = preload("res://Niveles/Props/landing_base.tscn")
func _ready() -> void:
	radioplaneta = $planeta_circulo.mesh as CylinderMesh
	radioplaneta = radioplaneta.bottom_radius * 60
	circumfer = TAU * radioplaneta
	rebanadas = floor(circumfer/ 4)
	print(rebanadas)
	
	for i in rebanadas:
		var angulo = (TAU/ rebanadas)*i
		
		var x = cos(angulo) * (radioplaneta)
		var y = sin(angulo) * (radioplaneta)
		
		var pos = Vector3(x,y,0)
		
		spwn(pos,angulo)
	#var angulo = (TAU/ rebanadas) *1
func spwn(pos,angulo):
	
	var newinst = plata.instantiate()
	print(angulo)
	newinst.position = pos
	newinst.rotation.z = angulo + deg_to_rad(90)
	add_child(newinst)
	
	pass
	
