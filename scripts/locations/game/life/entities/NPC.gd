extends CharacterBody2D

var speed: float = 300.0
var behaviour: String = "aggressive"
var destination: Vector2 = Vector2.ZERO

func _physics_process(delta):
	if destination == Vector2.ZERO:
		find_destination()
		return

	var direction = (destination - global_position).normalized()
	velocity = direction * speed
	move_and_slide()  # встроенная коллизия — не нужен check_movement

	if global_position.distance_to(destination) < 10:
		find_destination()

func find_destination():
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	match behaviour:
		"aggressive":
			destination = player.global_position
		"scared":
			destination = global_position + (global_position - player.global_position)
		"idle":
			destination = global_position + Vector2(randf_range(-200, 200), randf_range(-200, 200))
