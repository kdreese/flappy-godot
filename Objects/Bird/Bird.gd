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
	$DeathSound.play()


func _process(delta: float) -> void:
	if alive:
		# 300 is the pipe's leftward speed
		$Line2D.rotation = Vector2(300, velocity.y).angle()
	else:
		$Line2D.rotation += ROTATE_SPEED * delta


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta

	if alive and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_BOOST
		$JumpSound.play()

	velocity = move_and_slide(velocity)
