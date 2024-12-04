extends Label

@onready var player = $"/root/Level1/Player/Marble"

func _process(_delta: float) -> void:
	text = str(player.linear_velocity.length() * 3.6).pad_zeros(2).pad_decimals(0) + ' km/h'
