
extends HTTPRequest

const BASE_URL := "https://ernesto.santos.edu.do"
const PLAYER_VILLAGE_ID = "0e73b275-ea99-4436-ae80-ee568350ae14"

var villages: Array = []
var village: Array = []

var get_queue: Array[String] = []
var post_queue: Array[Dictionary] = []
var post_queue_empty: = true
var http_get: HTTPRequest
var http_post: HTTPRequest
var http_get_all_villages: HTTPRequest

# Load all villages now only works for world map
func set_http_all_villages_nodes(hget: HTTPRequest) -> void:
	http_get_all_villages = hget
	if http_get_all_villages:
		http_get_all_villages.request_completed.connect(_on_get_all_village_completed)
		_refresh_all_villages()	
func _refresh_all_villages() -> void:
	http_get_all_villages.request("%s/village"%BASE_URL)
func _on_get_all_village_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code == 200:
		var json = JSON.new()
		if json.parse(body.get_string_from_utf8()) == OK and json.data is Array :
			villages = json.data
			print("all_villages")
	_refresh_all_villages()

# Load player village and update player villages resources now works only in village view
func set_http_nodes(hget_node: HTTPRequest, hpost_node: HTTPRequest) -> void:
	http_get = hget_node
	http_post = hpost_node
	if http_get:
		http_get.request_completed.connect(_on_get_completed)
	if http_post:
		http_post.request_completed.connect(_on_post_completed)
	_refresh_villages()	
func _refresh_villages() -> void:
	get_queue.append("%s/village/%s"%[BASE_URL,PLAYER_VILLAGE_ID])
	_process_get_queue()
func upgrade_resource(village_id: String, resource_id: String) -> void:
	var url = "https://ernesto.santos.edu.do/village/%s/upgrade/resource/%s" %[village_id, resource_id]
	post_queue.append({
		"url": url,
		"headers": ["Content-Type: application/json"]
	})
	if post_queue_empty:
		post_queue_empty = false
		_process_post_queue()
func _process_get_queue() -> void:
	if get_queue.is_empty():
		return
	var url = get_queue.pop_front()
	http_get.request(url)
func _process_post_queue() -> void:
	if post_queue.is_empty() or http_post.get_http_client_status() in [HTTPClient.STATUS_CONNECTING, HTTPClient.STATUS_RESOLVING, HTTPClient.STATUS_REQUESTING]:
		print("fin")
		post_queue_empty = true
		return
	var req = post_queue.pop_front()
	http_post.request(req.url, req.headers, HTTPClient.METHOD_POST)
	print("otro")
func _on_get_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code == 200:
		var json = JSON.new()
		if json.parse(str("["+body.get_string_from_utf8()+"]")) == OK and json.data is Array :
			village = json.data
			print("player_village")
	#get_tree().create_timer(0.5).timeout
	_refresh_villages()
func _on_post_completed(_result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code == 200:
		var json = JSON.new()
		if json.parse(body.get_string_from_utf8()) == OK:
			var data = json.data
			if data is Dictionary and data.get("success") == true:
				await get_tree().create_timer(0.3).timeout
				_refresh_villages()
	_process_post_queue()
