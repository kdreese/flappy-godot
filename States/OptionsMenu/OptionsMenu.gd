extends CenterContainer


var current_mapping_key = null


func _ready() -> void:
	update_contents()


func update_contents() -> void:
	var jump_text := ""
	for event in InputMap.get_action_list("jump"):
		if jump_text.length() > 0:
			jump_text += ", "
		if event is InputEventKey:
			jump_text += OS.get_scancode_string(event.scancode)
		elif event is InputEventJoypadButton:
			jump_text += "Joy btn " + str(event.button_index)
		elif event is InputEventJoypadMotion:
			jump_text += "Joy axis " + str(event.axis)
		else:
			jump_text += event.as_text()
	if jump_text.length() == 0:
		jump_text = "<Unmapped>"
	$VBoxContainer/GridContainer/JumpKeys.text = jump_text
	$VBoxContainer/VBoxContainer/MuteToggle.pressed = SaveData.sound
	$VBoxContainer/VBoxContainer/FullscreenToggle.pressed = OS.window_fullscreen


func _on_AddJumpButton_pressed() -> void:
	current_mapping_key = "jump"


func _on_ResetJumpButton_pressed() -> void:
	InputMap.action_erase_events("jump")
	update_contents()


func _unhandled_input(event: InputEvent) -> void:
	if current_mapping_key:
		remap_action_to(event)
		update_contents()
		current_mapping_key = null


func remap_action_to(event):
	InputMap.action_add_event(current_mapping_key, event)


func _on_ReturnButton_pressed() -> void:
	SaveData.save_settings()
	var error = get_tree().change_scene("res://States/Menu/Menu.tscn")
	assert(not error)


func _on_MuteToggle_toggled(button_pressed: bool) -> void:
	SaveData.sound = button_pressed
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), not SaveData.sound)


func _on_FullscreenToggle_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed
