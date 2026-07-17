extends Area2D

@export var zone_name: String = "field"

func _ready():
	body_entered.connect(_on_enter)
	body_exited.connect(_on_exit)

func _on_enter(body):
	if body.is_in_group("player"):
		$Life.enter_zone(zone_name)  # сообщаем карте


func _on_exit(body):
	if body.is_in_group("player"):
		$Life.exit_zone(zone_name)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
