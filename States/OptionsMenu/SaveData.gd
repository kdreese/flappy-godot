extends Node


const SAVE_PATH := "user://config.cfg"

var high_score := 0
var sound := true


func _ready() -> void:
	load_settings()


func load_settings() -> void:
	var config := ConfigFile.new()
	var error := config.load(SAVE_PATH)
	if error == OK:
		if config.has_section_key("score", "high_score"):
			var high_score_config = config.get_value("score", "high_score")
			if high_score_config is int:
				high_score = high_score_config
		if config.has_section_key("settings", "sound"):
			var sound_config = config.get_value("settings", "sound")
			if sound_config is bool:
				sound = sound_config
				AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), not sound)
		if config.has_section_key("settings", "fullscreen"):
			var fullscreen_config = config.get_value("settings", "fullscreen")
			if fullscreen_config is bool:
				OS.window_fullscreen = fullscreen_config
		if config.has_section_key("inputs", "jump"):
			var jump_config = config.get_value("inputs", "jump")
			if jump_config is Array:
				for event in jump_config:
					if not (event is InputEvent):
						return	# Improperly formatted, bailout
				InputMap.action_erase_events("jump")
				for event in jump_config:
					InputMap.action_add_event("jump", event)


func save_settings() -> void:
	var config := ConfigFile.new()
	config.set_value("score", "high_score", high_score)
	config.set_value("inputs", "jump", InputMap.get_action_list("jump"))
	config.set_value("settings", "sound", sound)
	config.set_value("settings", "fullscreen", OS.window_fullscreen)
	var error := config.save(SAVE_PATH)
	assert(not error)
