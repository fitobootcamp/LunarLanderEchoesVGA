extends SubViewportContainer


@onready var arraybuttons : Array [Control]  = [$SubViewport/Control/button2,$SubViewport/Control/button,$SubViewport/Control/button3,$SubViewport/Control/button4]
@export_enum("Main","Pause") var menutype : String
var noquieropensar = 0
var buttondic = {
	"Main":
		{
			"buttonnames" : ["PLAY", "OPTIONS","CREDITS","EXIT"],
			
		},
	"Pause":
		{
			"buttonnames" :["PLAY", "RESET","OPTIONS","EXIT"],
			
			}
	}

func _ready() -> void:
	if menutype:
		$SubViewport/Control/modedisplay.text = menutype
		$SubViewport/Control/modedisplay/greeblemodeid.text = String.num_int64((int(menutype)+TAU),2)
		for i in arraybuttons:
			
			i.buttontexter(buttondic[menutype]["buttonnames"][noquieropensar]) 
			
			noquieropensar +=1
		pass


func _on_button_clicked(_origin: Variant) -> void:
	match _origin:
		"PLAY":
			visible = false
			get_tree().paused = false
		"OPTIONS":
			print("tienes opciones")
		"CREDITS":
			print("todavia no hay creditos")
		"EXIT":
			get_tree().quit()
		"RESET":
			get_tree().paused = false
			print(get_tree().current_scene.scene_file_path)
			get_tree().reload_current_scene()			
			visible = false
	pass # Replace with function body.
