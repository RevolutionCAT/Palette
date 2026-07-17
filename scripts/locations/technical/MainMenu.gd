extends Control

func w(div: float) -> float: return GameManager.w(div)
func h(div: float) -> float: return GameManager.h(div)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		GameManager.handle_escape()


func Button(btn: TextureButton, normal: String, hover: String, pressed: String, size_x: float, size_y: float):
	btn.ignore_texture_size = true
	btn.stretch_mode = TextureButton.STRETCH_SCALE
	
	btn.texture_normal = load("res://assets/images/" + normal)
	btn.texture_hover = load("res://assets/images/" + hover)
	btn.texture_pressed = load("res://assets/images/" + pressed)
	
	btn.size = Vector2(int(size_x), int(size_y))


func _ready():
	set_anchors_preset(Control.PRESET_FULL_RECT)
	
	UI_layout()
	
	$PlayButton.pressed.connect(click_play_button)
	$SettingsButton.pressed.connect(click_settings_button)
	$SettingsButton/Label.add_theme_font_size_override("font_size", h(24))
	$ExitButton.pressed.connect(click_exit_button)
	$ExitButton/Label.add_theme_font_size_override("font_size", h(24))


func UI_layout():
	var W: int = int(w(1)) # screen Width
	var H: int = int(h(1)) # screen Height
	$Background.size = Vector2(W, H)
	
	#buttons creation
	Button($PlayButton, 'black.png', 'black.png', 'red.png', (H-h(4)-h(7)), (H-h(3)+h(12)))
	Button($SettingsButton, 'black.png', 'white.png', 'red.png', h(1.675), h(8))
	Button($ExitButton, 'black.png', 'white.png', 'red.png', h(1.675), h(8))
	
	#buttons position
	$PlayButton.position = Vector2(h(8), h(4)-h(20))
	$SettingsButton.position = Vector2(W-h(15)-h(1.675), H-h(15)-h(30)-h(4))
	$ExitButton.position = Vector2(W-h(15)-h(1.675), H-h(15)-h(8))





func click_play_button():
	GameManager.change_location("near_door", {"playing" = false})

func click_settings_button():
	GameManager.change_location("settings", {"playing" = false})

func click_exit_button():
	print('exit button pressed')
	get_tree().quit()
