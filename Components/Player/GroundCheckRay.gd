extends RayCast3D

@onready var marble: RigidBody3D = $"../Marble"
@onready var mesh_instance_3d: MeshInstance3D = $"../Marble/MeshInstance3D"

func _physics_process(_delta: float) -> void:
	global_position = mesh_instance_3d.global_position
	marble.grounded = is_colliding()
