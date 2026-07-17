# ModeBase.gd
class_name ModeBase
extends RefCounted

func on_enter(scene: Node): 
	pass
func on_update(delta, scene): 
	pass
func on_exit(scene: Node): 
	pass





func on_zone_enter(zone: String, scene: Node):
	scene.set_zone_visibility(zone)
		
		
#	$World/FieldZone.modulate = Color.WHITE if zone == "field" else Color(0.0, 0.0, 0.0, 0.95)
#	$World/BelowFieldZone.modulate = Color.WHITE if zone == "field" else Color(0.0, 0.0, 0.0, 0.95)
#	$World/CorridorZone.modulate = Color.WHITE if zone == "corridor" else Color(0.0, 0.0, 0.0, 0.95)
#	$World/RoomsZone.modulate = Color.WHITE if zone == "rooms" else Color(0.0, 0.0, 0.0, 0.95)
