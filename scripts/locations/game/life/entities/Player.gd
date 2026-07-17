extends CharacterBody2D

@export var speed: float     #@export делает видимым в Inspector



func _ready() -> void:
	print("speed: ", int(speed))



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		pass



func _physics_process(delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up",   "move_down")).normalized()

	velocity = direction * speed
	move_and_slide()
