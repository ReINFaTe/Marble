extends Control

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('restart'):
		get_tree().reload_current_scene()
		


func _on_touch_screen_button_pressed() -> void:
	if (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if OS.has_feature('web'):
		var window = JavaScriptBridge.get_interface('window')
		if (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN):
			JavaScriptBridge.eval("window.screen.orientation.lock('portrait').then(s => '', e => '')")
		else:
			JavaScriptBridge.eval("window.screen.orientation.lock('landscape').then(s => '', e => '')")
			
