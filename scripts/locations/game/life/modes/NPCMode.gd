class_name NPCMode
extends ModeBase

func _ready():
	pass

func on_enter(scene: Node):
	print("NPCMode entered")
	
	var spawn_pos = Vector2(1500, 1400)
	
	var player = preload("res://scenes/locations/game/entities/Player.tscn").instantiate()
	player.position = spawn_pos
	player.speed = GameManager.h(2.22)
	
	scene.get_node("Entities").add_child(player)
	
	scene.set_zone_visibility("hall")




func _on_zone_enter(zone: String, scene: Node):
	pass
