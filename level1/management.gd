extends Control

var horse_data
var horses = []
var player_data
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rank_1_race.pressed.connect(rank1)
	$rank_2_race.pressed.connect(rank2)
	$rank_3_race.pressed.connect(rank3)
	$feed.pressed.connect(feed)
	$train.pressed.connect(train)
	render_data()
func _on_visibility_changed():
	render_data()

func render_data():
	horse_data = get_parent().get_player_horse()
	$Control/stats.text = "stamina: %s \n speed: %s" % [horse_data.stamina, horse_data.speed]
	player_data = get_parent().get_player_data()
	$player_stats/player_stat_list.text = "money: %s \nrank: %s" % [player_data.money, player_data.rank]
	horses = get_parent().get_horses()
func update_data():
	render_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func rank1():
	var horses = get_parent().get_horses()
	var data = [horses[0]]
	get_parent().start_race(data)

func rank2():
	var horses = get_parent().get_horses()
	var data = [horses[0],horses[1]]
	get_parent().start_race(data)

func rank3():
	var horses = get_parent().get_horses()
	var data = [horses[0],horses[1],horses[2]]
	get_parent().start_race(data)

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

	
