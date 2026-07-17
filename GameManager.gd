extends Node

func w(divide_by: float) -> float:
	return get_viewport().get_visible_rect().size.x / divide_by

func h(divide_by: float) -> float:
	return get_viewport().get_visible_rect().size.y / divide_by


func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


var state: String = "Menu"
var technical_state: String = "main_menu"
var previous_location: String = "main_menu"
var mode: String = "None"
var context: Dictionary = {}
var path: String = "technical/"


var escape_actions: Dictionary = {
	"main_menu": func(): pass,
	"settings": func(): change_location(previous_location),
	"near_door": func(): change_location(previous_location),
	"game": func(): pause_game(),
	"pause": func(): resume_game()
}


func handle_escape():
	var action = escape_actions.get(technical_state)
	if action:
		action.call()


var location_configs = {
	"main_menu": {
		"scene": "MainMenu.tscn",
		"is_game": false,
		"music": "",
	},
	"settings": {
		"scene": "Settings.tscn",
		"is_game": false,
		"music": "",
	},
	"near_door": {
		"scene": "NearDoor.tscn",
		"is_game": false,
		"music": "",
	},
	"lock_challenge": {
		"scene": "LockChallenge.tscn",
		"is_game": true,
		"music": "",
	},
	"game": {
		"scene": "Life.tscn",
		'is_game': true,
		'music': "",
	},
	
}



func change_location(loc_name: String, ctx: Dictionary = {}):
	var config = location_configs.get(loc_name)
	if config == null:
		print("Error: location ", loc_name, ' not found')
		return
	print('loc:  ', loc_name)
	
	
	if loc_name not in ["pause"]:
		previous_location = technical_state
	else:
		previous_location = 'game'
	
	
	if ctx.has("mode"):
		mode = ctx["mode"]
	
	technical_state = loc_name
	
	#music
	if config["music"] != "":
		# MusicManager.play(config["music"])
		pass
	
	
	path = "game/" if config["is_game"] else "technical/"
	get_tree().change_scene_to_file("res://scenes/locations/"+path+config["scene"])








func pause_game():
	get_tree().paused = true
	technical_state = "pause"
	previous_location = 'game'
	
	var pause_ui = preload("res://scenes/locations/game/Pause.tscn").instantiate()
	get_tree().current_scene.add_child(pause_ui)



func resume_game():
	get_tree().paused = false
	technical_state = "game"
	previous_location = 'pause'
	
	var pause_ui = get_tree().current_scene.get_node_or_null("pause")
	if pause_ui:
		pause_ui.queue_free()
