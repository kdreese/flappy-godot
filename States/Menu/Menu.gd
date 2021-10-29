extends CenterContainer


func _ready() -> void:
	$VBoxContainer/VBoxContainer/StartButton.grab_focus()


func _on_StartButton_pressed() -> void:
	var error = get_tree().change_scene("res://States/Game/Game.tscn")
	assert(not error)


func _on_OptionsButton_pressed() -> void:
	var error = get_tree().change_scene("res://States/OptionsMenu/OptionsMenu.tscn")
	assert(not error)


func _on_ExitButton_pressed() -> void:
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
