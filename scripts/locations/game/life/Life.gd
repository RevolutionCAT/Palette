extends Node2D

var current_mode: ModeBase

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		GameManager.handle_escape()

var mode_classes = {
	"player": PlayerMode,
	"npc": NPCMode,
	"god": GodMode,
}


func _on_zone_enter(zone: String, body: Node):
	print("on_zone_enter triggered!")
	if not body.is_in_group("player"):
		return
	if current_mode:
		current_mode.on_zone_enter(zone, self)



func _ready():
	set_zone_visibility("none")
	
	$World/Zones/Field.body_entered.connect(func(body): _on_zone_enter("field", body))
	$World/Zones/Hall.body_entered.connect(func(body): _on_zone_enter("corridor", body))
	$World/Zones/Rooms.body_entered.connect(func(body): _on_zone_enter("rooms", body))
	
	var mode_class = mode_classes.get(GameManager.mode)
	if mode_class:
		current_mode = mode_class.new()
		current_mode.on_enter(self)
	else:
		print("Error: unknown mode ", GameManager.mode)
	



func _process(delta):
	if current_mode:
		current_mode.on_update(delta, self)



func set_zone_visibility(active_zone: String):
	print('active zone:  ', active_zone)
	var zones = {
		"field": $World/Zones/Field,
		"hall": $World/Zones/Hall,
		"rooms": $World/Zones/Rooms,
	}
	
	for zone_name in zones:
		var is_active = (zone_name == active_zone)
		zones[zone_name].modulate = Color.WHITE if is_active else Color(0.3, 0.3, 0.3)
