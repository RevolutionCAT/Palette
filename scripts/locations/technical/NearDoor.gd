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
	
	$Door.pressed.connect(force_door)
	$LockButton.pressed.connect(click_lock_button)
	
	$ForceButton.pressed.connect(enable_force_button)
	$ForceButton/Label.text = "USE FORCE: \ndisabled"
	$ForceButton/Label.add_theme_font_size_override("font_size", h(22))


func UI_layout():
	var W: int = int(w(1)) # screen Width
	var H: int = int(h(1)) # screen Height
	$Background.size = Vector2(W, H)
	
	#obj creation
	Button($Door, 'black.png', 'black.png', 'dark_floor.png', (H-h(4)-h(7))*1.3, (H-h(3)+h(12))*1.3)
	Button($LockButton, 'dark_floor.png', 'white.png', 'red.png', h(15), h(15))
	Button($ForceButton, 'red.png', 'black.png', 'pit.png', w(4), h(8))
	
	#obj position
	$Door.position = Vector2(w(2)-($Door.size.x/2), h(10))
	$LockButton.position = Vector2($Door.position.x+$Door.size.x-$LockButton.size.x, $Door.position.y+h(2.4))
	$ForceButton.position = Vector2(W-h(15)-w(4), H-h(15)-h(30)-h(4))




func click_lock_button():
	GameManager.change_location("lock_challenge", {})


var force_enabled: bool = false
var force_used: int = 0

func enable_force_button():
	force_enabled = not force_enabled
	if force_enabled:
		$Door.disabled = false
		$ForceButton/Label.text = "USE FORCE: \nenabled"
	else:
		$ForceButton/Label.text = "USE FORCE: \ndisabled"

func force_door():
	force_used += 1
	if force_used == 4:
		GameManager.change_location("game", {"playing": true, "mode": "npc"})
