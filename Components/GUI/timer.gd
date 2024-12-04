extends Label

var time_milis: float = 0
var seconds: int = 0

var stopped: bool = false

func _process(delta: float) -> void:
	if stopped:
		return
		
	calc_time(delta)
	var minutes: int = seconds/60
	
	text = str(minutes) + ':' + str(seconds % 60).pad_zeros(2) + ':' + str(time_milis * 1000).pad_zeros(3).pad_decimals(0)

func calc_time(delta: float) -> void:
	time_milis += delta;
	if time_milis < 1:
		return
	var delta_int_sec: int = time_milis
	time_milis -= delta_int_sec
	
	seconds += delta_int_sec
	
