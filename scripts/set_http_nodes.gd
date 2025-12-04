extends Node

func _ready():
	Http.set_http_nodes($HTTPRequest_Get, $HTTPRequest_Post)
