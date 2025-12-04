extends Node

#Player villalge index
const PLAYER_VILLAGE_INDEX = 0
const WAIT_TIME_INTERVAL = 2
var player_village = null 
var all_village = null


func _process(_delta: float) -> void:
	if Http.village:
		player_village = Http.village[PLAYER_VILLAGE_INDEX].village
	if Http.villages:
		all_village = Http.villages
