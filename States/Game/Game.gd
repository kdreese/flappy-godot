extends Node2D


var pipe_scene := preload("res://Objects/Pipe/Pipe.tscn")
var score := 0


func _ready() -> void:
	randomize()


func _process(_delta: float) -> void:
	pass


func _on_PipeSpawnTimer_timeout() -> void:
	var pipe = pipe_scene.instance()
	var offset = rand_range(-200, 200)
	pipe.position = Vector2(get_viewport_rect().size.x + 100, get_viewport_rect().size.y / 2 + offset)

	pipe.connect("hit_pipe", self, "_on_Pipe_hit_pipe")
	pipe.connect("score_point", self, "_on_Pipe_score_point")
	$Pipes.add_child(pipe)


func _on_Pipe_hit_pipe() -> void:
	game_over()


func _on_Border_body_entered(_body: Node) -> void:
	game_over()


func _on_Pipe_score_point() -> void:
	score += 1
	$ScoreLabel.text = "Score: %d" % score


func game_over() -> void:
	$Bird.queue_free()
