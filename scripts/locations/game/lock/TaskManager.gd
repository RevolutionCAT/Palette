extends Node

var time_left: float = 600.0  # 10 минут

func _process(delta):
	time_left -= delta
#	update_timer_display()
	if time_left <= 0:
		challenge_complete()

func challenge_complete():
	GameManager.change_location("forest", {"mode": GameManager.mode})
