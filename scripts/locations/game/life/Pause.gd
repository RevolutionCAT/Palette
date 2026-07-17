extends CanvasLayer

func w(div: float) -> float: return GameManager.w(div)
func h(div: float) -> float: return GameManager.h(div)



func Button(btn: TextureButton, normal: String, hover: String, pressed: String, size_x: float, size_y: float):
	btn.ignore_texture_size = true
	btn.stretch_mode = TextureButton.STRETCH_SCALE
	
	btn.texture_normal = load("res://assets/images/" + normal)
	btn.texture_hover = load("res://assets/images/" + hover)
	btn.texture_pressed = load("res://assets/images/" + pressed)
	
	btn.size = Vector2(int(size_x), int(size_y))




func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	name = "pause"
	
	UI_layout()
	
	$ContinueButton.pressed.connect(on_continue_pressed)
	$ContinueButton/Label.add_theme_font_size_override("font_size", h(24))
	$SettingsButton.pressed.connect(click_settings_button)
	$SettingsButton/Label.add_theme_font_size_override("font_size", h(24))
	$ExitButton.pressed.connect(on_exit_pressed)
	$ExitButton/Label.add_theme_font_size_override("font_size", h(24))




func UI_layout():
	var W: int = int(w(1)) # screen Width
	var H: int = int(h(1)) # screen Height
	$WindowBackground.size = Vector2(h(0.88), h(1.5))
	$WindowBackground.position = Vector2(w(2)-($WindowBackground.size.x/2), h(2)-($WindowBackground.size.y/2))
	
	#buttons creation
	Button($ContinueButton, 'black.png', 'black.png', 'red.png', h(1.675), h(8.2))
	Button($SettingsButton, 'black.png', 'white.png', 'red.png', h(1.675), h(8.2))
	Button($ExitButton, 'black.png', 'white.png', 'red.png', h(1.675), h(8.2))
	
	#buttons position
	var indent: float = h(36)
	$SettingsButton.position = Vector2($WindowBackground.position.x+($WindowBackground.size.x/2)-($SettingsButton.size.x/2), $WindowBackground.position.y+($WindowBackground.size.y/2)-($SettingsButton.size.y/2))
	$ContinueButton.position = Vector2($WindowBackground.position.x+($WindowBackground.size.x/2)-($ContinueButton.size.x/2), $SettingsButton.position.y-$ContinueButton.size.y-indent)
	$ExitButton.position = Vector2($WindowBackground.position.x+($WindowBackground.size.x/2)-($ExitButton.size.x/2), $SettingsButton.position.y+$ExitButton.size.y+indent)




func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled() #doesnt pass this further into Life.gd
		GameManager.resume_game()

func on_continue_pressed():
	GameManager.resume_game()
	
func click_settings_button():
	pass

func on_exit_pressed():
	get_tree().paused = false
	GameManager.change_location("main_menu")
