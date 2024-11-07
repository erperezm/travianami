extends HTTPRequest

@onready var http_request: HTTPRequest = $"."
const url = "http://localhost:30000/village"
signal data_loaded(villages)

func _ready() -> void:
	
	print("se pidio")
	http_request.request(url)
	http_request.connect("request_completed", Callable(self, "_on_request_completed"))  # Usar Callable aquí

func _on_request_completed(result, response_code, headers, body): 
	print("termino")
	var villages = JSON.parse_string(body.get_string_from_utf8())
	data_loaded.emit(villages)
