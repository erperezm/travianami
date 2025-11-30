extends Node

#Parent node (all buttons container)
@onready var fields_parent_node = $"."

func _ready() -> void:
	ENV.connect("player_village_loaded", Callable(self, "_on_player_village_loaded"))
	
	
# Iterate over all --field button nodes-- setting [level] and [tooltip] text
func set_resource_level():
	if ENV.player_village:
		var field_button_index = 0
		var field = null
		
		# Iterate over all 18 field buttons
		for field_button in fields_parent_node.get_children():
			if field_button is Button:
				field = ENV.player_village.field.resources[field_button_index]
				
				field_button.text = str(field.level)
				field_button.tooltip_text = "APH:" + str(field.amountPerHour).split(".", true, 0)[0]
				
				field_button_index +=1

# Update field level  [requested by buttons]
func update_resource_field(field_button: BaseButton) -> void:
	if ENV.player_village:
		var field_button_index = field_button.get_meta("index")

		HttpRequest_G.p_request(ENV.player_village.Id, ENV.player_village.field.resources[field_button_index].Id)
		
		set_resource_level()

# This signal comes from loader script when <<payer_village>> variable is setted
func _on_player_village_loaded() -> void:
	set_resource_level()

#region update field signal recived from villagge button fields
func _on_field_1_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_2_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_3_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_4_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_5_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_6_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_7_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_8_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_9_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_10_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_11_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_12_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_13_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_14_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_15_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_16_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_17_pressed(source: BaseButton) -> void:
	update_resource_field(source)


func _on_field_18_pressed(source: BaseButton) -> void:
	update_resource_field(source)
#endregion
