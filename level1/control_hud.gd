extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$start.pressed.connect(on_start)
	$restart.pressed.connect(on_restart)
	$quit.pressed.connect(on_quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_start():
	get_parent().go()
	
func on_restart():
	get_parent().restart()

func on_quit():
	get_parent().quit_race()
