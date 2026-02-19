extends Node

var current_scene

func _ready():
	_on_start_game()

func load_scene(scene: PackedScene):
	# Remove existing child
	if current_scene:
		current_scene.queue_free()

	# Add new child
	current_scene = scene.instantiate()
	add_child(current_scene)
	
	if current_scene.has_signal("start_game"):
		current_scene.start_game.connect(_on_start_game)

func _on_start_game():
	load_scene(preload("res://level1/level1.tscn"))
