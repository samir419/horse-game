extends Node
var horses =[
	{
		'name':'horse1',
		'owner':'cpu',
		'stamina':20,
		'energy':20,
		'speed':5,
	},
	{
		'name':'horse2',
		'owner':'player',
		'stamina':20,
		'energy':20,
		'speed':5,
	},
	{
		'name':'horse3',
		'owner':'cpu',
		'stamina':20,
		'energy':20,
		'speed':5,
	}
]
var player_data = {
	'money':100,
	'rank':1
	}
var main_horse
var horse_list = []
var race_winners = []
var race_state = 'wait'
@onready var game = $race
@onready var hud = $control_hud
@onready var management = $management

@onready var camera = $race/Camera3D

@onready var horse_scene = preload("res://horse/horse.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	management.visible=true
	game.visible=false
	hud.visible=false

func start_race():
	management.visible=false
	game.visible=true
	hud.visible=true
	var count = 3
	var spacing = 2.0
	var total_width = (count - 1) * spacing
	var start_x = -total_width / 2

	for i in range(count):
		var horse = horse_scene.instantiate()
		horse_list.append(horse)
		add_child(horse)
		horse.set_data(horses[i])

		horse.position.y = 2
		horse.position.z = 0
		horse.position.x = start_x + i * spacing

		if horse.rider == "player":
			main_horse = horse
	race_state = 'running'

func go():
	print('go')
	for horse in horse_list:
		horse.gallop()

func restart():
	for horse in horse_list:
		horse.queue_free()
	horse_list=[]
	start_race()

func quit_race():
	for horse in horse_list:
		horse.queue_free()
	horse_list=[]
	management.visible=true
	game.visible=false
	hud.visible=false

func get_player_horse():
	for i in range(3):
		if horses[i].owner == "player":
			return horses[i]

func get_horses():
	return horses

func set_horses(data):
	horses = data

func get_player_data():
	return player_data

func set_player_data(data):
	player_data = data

func handle_race_win():
	player_data.money+=50
	$management.update_data()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if race_state == 'wait':
		return
	if main_horse:
		camera.position.x = main_horse.position.x
		camera.position.y = main_horse.position.y+2
		camera.position.z=main_horse.position.z+2.5
		
