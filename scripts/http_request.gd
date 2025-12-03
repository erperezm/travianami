extends HTTPRequest
var requesting = false

@onready var http_request: HTTPRequest = $"."
const url = "https://ernesto.santos.edu.do/village" #remote
#const url = "http://localhost:30000/village"  #local
var villages = null
var loaded = false

func _ready() -> void:
	h_request()
	http_request.connect("request_completed", Callable(self, "_on_request_completed")) 
func p_request(village_id, resource_id):
	loaded = false
	var headers = ["Content-Type: application/json"]
	var post  = url + "/" + village_id + "/upgrade/resource/" + resource_id	
	print(post)
	if !requesting:
		var error = http_request.request(post, headers, HTTPClient.METHOD_POST)
		requesting = true
		print(error)
	
func h_request():
	print("se pidio")
	if !requesting:
		http_request.request(url)
		requesting = true
	

func _on_request_completed(_result, _response_code, _headers, body): 
	requesting = false
	var data = JSON.parse_string(body.get_string_from_utf8())
	
	if typeof(data) == 28:
		villages = JSON.parse_string(body.get_string_from_utf8())
		loaded=true
		print("termino con las villas")
	else:
		loaded=false
		print(data.message)
		print("termino con otra cosa")
	
var wait3s = false
func _process(_delta):
	if wait3s:
		return
	else:
		wait3s = true
		await get_tree().create_timer(3.0).timeout # wait for 1 second
		h_request()
		print("se pidio de nuevo")
		wait3s = false
