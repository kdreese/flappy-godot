extends KinematicBody2D


const GRAVITY = 450
const JUMP_BOOST = -300
const ROTATE_SPEED = 2

var velocity := Vector2()
var alive := true


func die() -> void:
	if not alive:
		return
	alive = false
	velocity = Vector2(-200, -200)


func _process(delta: float) -> void:
	if not alive:
		rotation += ROTATE_SPEED * delta



func _physics_process(delta: float) -> void:
	if alive and Input.is_action_just_pressed("game_jump"):
		velocity.y = JUMP_BOOST
	else:
		velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity)
