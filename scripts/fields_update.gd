extends Node

#region buttons

@onready var field_1: Button = $field1
@onready var field_2: Button = $field2
@onready var field_3: Button = $field3
@onready var field_4: Button = $field4
@onready var field_5: Button = $field5
@onready var field_6: Button = $field6
@onready var field_7: Button = $field7
@onready var field_8: Button = $field8
@onready var field_9: Button = $field9
@onready var field_10: Button = $field10
@onready var field_11: Button = $field11
@onready var field_12: Button = $field12
@onready var field_13: Button = $field13
@onready var field_14: Button = $field14
@onready var field_15: Button = $field15
@onready var field_16: Button = $field16
@onready var field_17: Button = $field17
@onready var field_18: Button = $field18
#endregion


func _ready() -> void:
	set_resource_level()
	
var wait3s = false	
func _process(delta: float) -> void:
	if(HttpRequest_G.loaded):
		if wait3s:
		#print("waiting  seconds")
			return
		else:
			wait3s = true
			await get_tree().create_timer(1.0).timeout # wait for 1 second
			set_resource_level()
			print("se actualizo la villa de nuevo")
			wait3s = false

func set_resource_level():
	if HttpRequest_G.loaded:
		field_1.text = str(HttpRequest_G.villages[3].field.resources[0].level)
		field_1.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[0].amountPerHour).split(".", true, 0)[0]

		field_2.text = str(HttpRequest_G.villages[3].field.resources[1].level)
		field_2.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[1].amountPerHour).split(".", true, 0)[0]

		field_3.text = str(HttpRequest_G.villages[3].field.resources[2].level)
		field_3.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[2].amountPerHour).split(".", true, 0)[0]

		field_4.text = str(HttpRequest_G.villages[3].field.resources[3].level)
		field_4.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[3].amountPerHour).split(".", true, 0)[0]

		field_5.text = str(HttpRequest_G.villages[3].field.resources[4].level)
		field_5.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[4].amountPerHour).split(".", true, 0)[0]

		field_6.text = str(HttpRequest_G.villages[3].field.resources[5].level)
		field_6.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[5].amountPerHour).split(".", true, 0)[0]

		field_7.text = str(HttpRequest_G.villages[3].field.resources[6].level)
		field_7.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[6].amountPerHour).split(".", true, 0)[0]

		field_8.text = str(HttpRequest_G.villages[3].field.resources[7].level)
		field_8.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[7].amountPerHour).split(".", true, 0)[0]

		field_9.text = str(HttpRequest_G.villages[3].field.resources[8].level)
		field_9.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[8].amountPerHour).split(".", true, 0)[0]

		field_10.text = str(HttpRequest_G.villages[3].field.resources[9].level)
		field_10.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[9].amountPerHour).split(".", true, 0)[0]

		field_11.text = str(HttpRequest_G.villages[3].field.resources[10].level)
		field_11.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[10].amountPerHour).split(".", true, 0)[0]

		field_12.text = str(HttpRequest_G.villages[3].field.resources[11].level)
		field_12.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[11].amountPerHour).split(".", true, 0)[0]

		field_13.text = str(HttpRequest_G.villages[3].field.resources[12].level)
		field_13.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[12].amountPerHour).split(".", true, 0)[0]

		field_14.text = str(HttpRequest_G.villages[3].field.resources[13].level)
		field_14.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[13].amountPerHour).split(".", true, 0)[0]

		field_15.text = str(HttpRequest_G.villages[3].field.resources[14].level)
		field_15.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[14].amountPerHour).split(".", true, 0)[0]

		field_16.text = str(HttpRequest_G.villages[3].field.resources[15].level)
		field_16.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[15].amountPerHour).split(".", true, 0)[0]

		field_17.text = str(HttpRequest_G.villages[3].field.resources[16].level)
		field_17.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[16].amountPerHour).split(".", true, 0)[0]

		field_18.text = str(HttpRequest_G.villages[3].field.resources[17].level)
		field_18.tooltip_text = "APH:" + str(HttpRequest_G.villages[3].field.resources[17].amountPerHour).split(".", true, 0)[0]

func _on_field_1_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[0].Id)
	set_resource_level()

func _on_field_2_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[1].Id)
	set_resource_level()

func _on_field_3_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[2].Id)
	set_resource_level()


func _on_field_4_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[3].Id)
	set_resource_level() 


func _on_field_5_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[4].Id)
	set_resource_level() 


func _on_field_6_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[5].Id)
	set_resource_level() 


func _on_field_7_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[6].Id)
	set_resource_level() 


func _on_field_8_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[7].Id)
	set_resource_level() 


func _on_field_9_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[8].Id)
	set_resource_level() 


func _on_field_10_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[9].Id)
	set_resource_level() 


func _on_field_11_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[10].Id)
	set_resource_level() 


func _on_field_12_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[11].Id)
	set_resource_level() 


func _on_field_13_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[12].Id)
	set_resource_level() 


func _on_field_14_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[13].Id)
	set_resource_level()


func _on_field_15_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[14].Id)
	set_resource_level() 


func _on_field_16_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[15].Id)
	set_resource_level() 


func _on_field_17_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[16].Id)
	set_resource_level() 


func _on_field_18_pressed() -> void:
	HttpRequest_G.p_request(HttpRequest_G.villages[3].Id,HttpRequest_G.villages[3].field.resources[17].Id)
	set_resource_level() 
