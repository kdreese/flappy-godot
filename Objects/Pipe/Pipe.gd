extends Node2D


signal hit_pipe

const SPEED = 100


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	position.x -= SPEED * delta
	if position.x < -100:
		queue_free()


func _on_Pipe_body_entered(_body: Node) -> void:
	emit_signal("hit_pipe")
