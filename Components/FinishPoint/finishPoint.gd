extends Node3D


func _on_finish_area_body_entered(body: Node3D) -> void:
	if body.owner.is_in_group("player"):
		var camera = body.owner.get_node("CameraContainer")
		camera.smooth_camera_tolerance = .01
		camera.level_finished = true
		body.can_move = false
		body.level_finished = true
