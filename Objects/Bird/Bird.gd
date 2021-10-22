extends KinematicBody2D


var velocity := Vector2()
const GRAVITY = 450
const JUMP_BOOST = -300


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("game_jump"):
		velocity.y = JUMP_BOOST
	else:
		velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity)
