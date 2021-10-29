extends Node2D


signal hit_pipe
signal score_point

const SPEED = 300

var moving := true


func _process(delta: float) -> void:
	if moving:
		position.x -= SPEED * delta
		if position.x < -100:
			queue_free()


func _on_Pipe_body_entered(_body: Node) -> void:
	emit_signal("hit_pipe")


func _on_ScoreLine_body_exited(body: Node) -> void:
	if not body.is_queued_for_deletion() and body.alive:
		emit_signal("score_point")
