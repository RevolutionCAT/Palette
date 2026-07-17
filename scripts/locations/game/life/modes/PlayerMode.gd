class_name PlayerMode
extends ModeBase

func on_enter(scene: Node):
	# создать игрока
	var player = preload("res://scenes/locations/game/entities/Player.tscn").instantiate()
	player.position = Vector2(500, 500)  # стартовая позиция
	scene.get_node("Entities").add_child(player)
	
#	scene.get_node("World/Field").modulate = Color.WHITE
#	scene.get_node("World/Corridors").modulate = Color(0.3, 0.3, 0.3)
#	scene.get_node("World/Rooms").modulate = Color(0.3, 0.3, 0.3)
	scene.set_zone_visibility("field")
