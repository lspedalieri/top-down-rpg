class_name State_Attack extends State

@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/AttackSwordEffect/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@export var attack_sound : AudioStream
@export_range(1,20, 0.5) var decelerate_speed : float = 5.0
@onready var hurt_box: HurtBox = $"../../Interactions/HurtBox"

var attacking : bool = false

func _ready() -> void:
	hurt_box.monitoring = false
	
	
## What happens when the player enters this State?
func enter() -> void:
	player.updateAnimation("attack")
	attack_anim.play("attack_" + player.animDirection())
	animation_player.animation_finished.connect(endAttack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true
	await get_tree().create_timer(0.0075).timeout
	hurt_box.monitoring = attacking
	pass


## What happens when the player exits this State?
func exit() -> void:
	animation_player.animation_finished.disconnect(endAttack)
	attacking = false
	hurt_box.monitoring = attacking

## What happens during the _process_update in this State?
func process(_delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

## What happens during the _physics_process in this State?
func physics(_delta : float) -> State:
	return null


## What happens during the input events in this State?
func handleInput( _event: InputEvent) -> State:
	return null

func endAttack(_new_anim_name : String) ->void:
	attacking = false
	print ("attacking false")
