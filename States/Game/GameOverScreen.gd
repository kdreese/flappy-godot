extends ColorRect


onready var score_label: Label = $PanelContainer/CenterContainer/VBoxContainer/Score
onready var high_score_label: Label = $PanelContainer/CenterContainer/VBoxContainer/HighScore


func show_screen(score: int) -> void:
	score_label.text = "You Scored: %d" % [score]
	if score > SaveData.high_score:
		high_score_label.text = "New High Score!"
		SaveData.high_score = score
		SaveData.save_settings()
	else:
		high_score_label.text = "High Score: %d" % [SaveData.high_score]
	$EntranceAnimation.play("EntranceAnimation")


func _on_ReplayButton_pressed() -> void:
	var error = get_tree().reload_current_scene()
	assert(not error)


func _on_MenuButton_pressed() -> void:
	var error = get_tree().change_scene("res://States/Menu/Menu.tscn")
	assert(not error)
