extends Control

var horse_data
var horses = []
var player_data
var selected = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var buttons = [
		$rank_1_race,
		$rank_2_race,
		$rank_3_race
	]
	for i in range(buttons.size()):
		buttons[i].pressed.connect(func(): set_num(i))
	$start_race.pressed.connect(select_horse)
	render_data()
func _on_visibility_changed():
	render_data()

func render_data():
	horses = get_parent().get_horses()
	
func update_data():
	pass

func set_num(i):
	selected = i
	
func select_horse():
	var horses = get_parent().get_horses()
	for i in range(horses.size()):
		if i == selected:
			horses[i].owner = "player"
		else:
			horses[i].owner = "cpu"
	get_parent().start_race(horses)

func feed():
	if player_data.money>= 10:
		player_data.money-=10
		horse_data.stamina+=5
		render_data()
	
func train():
	if player_data.money>= 30:
		player_data.money-=30
		horse_data.speed+=0.1
		render_data()

	
