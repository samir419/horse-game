extends Control

var horse_data
var player_data
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"start race".pressed.connect(on_start)
	$feed.pressed.connect(feed)
	render_data()
func _on_visibility_changed():
	render_data()

func render_data():
	horse_data = get_parent().get_player_horse()
	$Control/stats.text = "stamina: %s \n speed: %s" % [horse_data.stamina, horse_data.speed]
	player_data = get_parent().get_player_data()
	$player_stats/player_stat_list.text = "money: %s \nrank: %s" % [player_data.money, player_data.rank]

func update_data():
	render_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func on_start():
	get_parent().start_race()

func feed():
	horse_data.speed+=1
	player_data.money-=10
	render_data()
	
