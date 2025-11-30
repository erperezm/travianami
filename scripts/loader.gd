extends Node

#Player villalge index
const PLAYER_VILLAGE_INDEX = 3
const WAIT_TIME_INTERVAL = 2
var player_village = null 
signal player_village_loaded()


func _ready() -> void:
	get_remote_world_data()
	continuous_timer()

# Infinite timer. Deamon for update village data in <<WAIT_TIME_INTERVAL>> time.
func continuous_timer() -> void:
	var timer = Timer.new()
	timer.wait_time = WAIT_TIME_INTERVAL 
	timer.autostart = true
	timer.one_shot = false 
	add_child(timer)
	timer.timeout.connect(_on_continuous_timer_timeout)
func _on_continuous_timer_timeout():
	get_remote_world_data()


func get_remote_world_data() -> void:
	if(HttpRequest_G.loaded): 
		player_village = HttpRequest_G.villages[PLAYER_VILLAGE_INDEX]
		emit_signal("player_village_loaded")
