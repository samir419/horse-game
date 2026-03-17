extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$start.pressed.connect(on_start)
	$quit.pressed.connect(on_quit)
	$whip.pressed.connect(whip_function)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_start():
	get_parent().go()
func whip_function():
	get_parent().whip_horse()
func on_restart():
	get_parent().restart()

func on_quit():
	get_parent().quit_race()
