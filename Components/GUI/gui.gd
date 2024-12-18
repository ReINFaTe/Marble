extends Control

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('restart'):
		get_tree().reload_current_scene()
		


func _on_touch_screen_button_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
