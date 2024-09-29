class_name Plant extends Node2D

@onready var hit_box: HitBox = $HitBox

func _ready() -> void:
	print("hitbox connected")
	hit_box.damaged.connect( takeDamage )
	pass

func takeDamage(damage : int) -> void:
	queue_free()
	pass
