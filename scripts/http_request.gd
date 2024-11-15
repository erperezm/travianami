extends HTTPRequest

@onready var http_request: HTTPRequest = $"."
const url = "https://ernesto.santos.edu.do/village" #remote
#const url = "http://localhost:30000/village"  #local
var villages = null
var loaded = false

func _ready() -> void:
	h_request()

func h_request():
	print("se pidio")
	http_request.request(url)
	http_request.connect("request_completed", Callable(self, "_on_request_completed")) 

func _on_request_completed(_result, _response_code, _headers, body): 
	print("termino")
	villages = JSON.parse_string(body.get_string_from_utf8())
	loaded=true
	
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
