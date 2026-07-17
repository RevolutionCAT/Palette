# Wall.gd
extends Node2D

@export var front_zone: String = "corridor"  # откуда видна передняя сторона
@export var back_zone: String = "rooms"      # откуда видна задняя сторона



func update_visibility(current_zone: String):
	$FrontSprite.visible = (current_zone == front_zone)
	$BackSprite.visible  = (current_zone == back_zone)
