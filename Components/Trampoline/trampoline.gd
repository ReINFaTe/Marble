extends Node3D

func _on_area_3d_body_shape_entered(_body_rid: RID, body: Node3D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.owner.is_in_group("player"):
		var lol: RigidBody3D = body
		lol.apply_central_force(Vector3.UP * 500)
