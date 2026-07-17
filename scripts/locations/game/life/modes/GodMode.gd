class_name GodMode
extends ModeBase

func on_enter(scene: Node):
	var player = preload("res://scenes/locations/game/entities/Player.tscn").instantiate()
	player.speed = GameManager.w(4)
	player.position = Vector2(500, 500)
	scene.get_node("Entities").add_child(player)


	scene.get_node("World/Field").modulate    = Color.WHITE
	scene.get_node("World/Corridor").modulate = Color.WHITE
	scene.get_node("World/Rooms").modulate    = Color.WHITE
