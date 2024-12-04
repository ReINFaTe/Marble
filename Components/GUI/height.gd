extends Label

@onready var player: RigidBody3D = $"/root/Level1/Player/Marble"

func _process(_delta: float) -> void:
	text = str(player.global_position.y).pad_zeros(3).pad_decimals(0) + ' m'
