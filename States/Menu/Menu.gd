extends ColorRect


func _on_StartButton_pressed() -> void:
	var error = get_tree().change_scene("res://States/Game/Game.tscn")
	assert(not error)


func _on_ExitButton_pressed() -> void:
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
