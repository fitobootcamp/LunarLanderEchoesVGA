class_name Nave 
extends RigidBody3D

@export var impulso : float = 10
@export var inclinacion : float = 100
@export var combustible : float = 1000
@export var consumo : float = 10
@export var escudo : int = 1
@export var uimesh : bool = false
@export var sonidos : Array [AudioStream]

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var turbina: AudioStreamPlayer3D = $turbina

var veltrak

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$MeshInstance3D2.visible = uimesh
	gravity_scale = Globals.migravedad
	pass # Replace with function body.

#func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	#if radialgrav:
		#var cardinalvec = (Vector3(0,0,0)-position).normalized()
		#var gravity = 9.8
		#
		#gravity = (cardinalvec * gravity)
		#state.apply(gravity)
func _physics_process(delta: float) -> void:
	#print(global_position)
	veltrak = linear_velocity.y
	if Input.is_action_pressed("motor") and combustible > 0:
		combustible -= 1
		apply_central_impulse(basis.y * impulso * delta)
		combustible = clamp(combustible - (consumo * delta),0,combustible)
		$GPUParticles3D.emitting = true
		if turbina.playing == false:
			turbina.play()
		#printt("Combustible: ",combustible)
	if Input.is_action_just_released("motor"):
		$GPUParticles3D.emitting = false
		
		turbina.stop()
		pass
	
	if Input.is_action_pressed("rotacion_left"):
		combustible -= 1 * delta
		apply_torque(Vector3(0,0,inclinacion * delta))
		$GPUParticles3D2.emitting = true
	if Input.is_action_just_released("rotacion_left"):
		$GPUParticles3D2.emitting = false
	if Input.is_action_pressed("rotacion_right"):
		combustible -= 1 * delta
		apply_torque(Vector3(0,0,-inclinacion * delta))
		$GPUParticles3D3.emitting = true
	if Input.is_action_just_released("rotacion_right"):
		$GPUParticles3D3.emitting = false
	
	pass
func crash_game_over(bod):
	var explo = load("res://Nave/Explo.tscn")
	var boomy = explo.instantiate()
	bod.add_child(boomy)
	boomy.global_position = global_position
	boomy.rotation.y = bod.rotation.y
	audio_stream_player_3d.stream = sonidos[0]
	audio_stream_player_3d.play()
	
	#get_tree().call_deferred("reload_curren_scene")
	return "Game Over"


func _on_body_entered(body: Node) -> void:
	
	print(body.get_groups())
	if body.is_in_group("Victoria"):
		audio_stream_player_3d.stream = sonidos[2]
		audio_stream_player_3d.play()
		
		print("Victoria")
	elif body.is_in_group("Crash"):
		print("Game Over")
		
		
		crash_game_over(body)
	elif body.is_in_group("Bonus"):
		print(veltrak)
		audio_stream_player_3d.stream = sonidos[1]
		audio_stream_player_3d.play()
		print("Bonus")

	
func gasser(_amount):
	
	combustible += _amount
