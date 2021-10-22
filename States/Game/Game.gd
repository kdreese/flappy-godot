extends Node2D


var pipe_scene := preload("res://Objects/Pipe/Pipe.tscn")


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_PipeSpawnTimer_timeout() -> void:
	var pipe = pipe_scene.instance()
	add_child(pipe)
	pipe.position = Vector2(get_viewport_rect().size.x + 100, get_viewport_rect().size.y / 2)
