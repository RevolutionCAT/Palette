extends Node

func w(div: float) -> float: return GameManager.w(div)
func h(div: float) -> float: return GameManager.h(div)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		GameManager.handle_escape()




func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass
