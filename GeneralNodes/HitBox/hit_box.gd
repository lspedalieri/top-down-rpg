class_name HitBox extends Area2D

signal damaged(damage:int)

func _ready() -> void:
	print("hit box class ready")
	pass

func _process(delta: float) -> void:
	pass


func takeDamage( damage : int ) -> void :
	print("take damage:", damage)
	damaged.emit(damage)
