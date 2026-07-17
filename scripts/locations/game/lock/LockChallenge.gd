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
	
	UI_layout()
	


func UI_layout():
	var W: int = int(w(1)) # screen Width
	var H: int = int(h(1)) # screen Height
	$Background.size = Vector2(W, H)
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
