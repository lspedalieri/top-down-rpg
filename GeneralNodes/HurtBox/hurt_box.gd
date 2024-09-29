class_name HurtBox extends Area2D

@export var damage : int = 1

func _ready() -> void:
	print("connected to area entered")
	area_entered.connect(areaEntered)
	
func _process(delta: float) -> void:
	pass

func areaEntered( area : Area2D) -> void:
	print("area entered")
	if area is HitBox :
		print("hitbox area")
		area.takeDamage( damage )
	pass
