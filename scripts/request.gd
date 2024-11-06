class_name RequestVillages extends Node

var url = "http://localhost:30000/village"
@onready var http_request = $"."
signal data_loaded(villages)


func _ready():
	http_request.request_completed.connect(_on_request_completed)
	send_request()
	
func send_request():
	var headers = ["Content-Type: application/json"]
	http_request.request(url,headers,HTTPClient.METHOD_GET)
	
func _on_request_completed(result, response_code, headers, body): 
	var villages = JSON.parse_string(body.get_string_from_utf8())
	data_loaded.emit(villages)
