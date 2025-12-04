extends Node

#Parent node (all buttons container)
@onready var fields_parent_node = $"."

func _ready() -> void:
	create_filds_signal()
	
# Iterate over all --field button nodes-- setting [level] and [tooltip] text
func set_resource_level():
	if ENV.player_village:
		var field_button_index = 0
		var field = null
		
		# Iterate over all 18 field buttons
		for field_button in fields_parent_node.get_children():
			if field_button is Button:
				field = ENV.player_village.field.resources[field_button_index]
				
				field_button.text = str(int(field.level))
				field_button.tooltip_text = "APH:" + str(field.amountPerHour).split(".", true, 0)[0]
				
				field_button_index +=1

# Update field level  [requested by buttons]
func upgrade_resource_field(field_button: BaseButton) -> void:
	if ENV.player_village:
		var field_button_index = field_button.get_meta("index")

		Http.upgrade_resource(ENV.player_village.Id, ENV.player_village.field.resources[field_button_index].Id)
		
		set_resource_level()

# Create dinamicly all button signals
func create_filds_signal() -> void:
	for field_button in fields_parent_node.get_children():
		if field_button is Button:
			field_button.pressed.connect(Callable(self, "_on_field_button_pressed").bind(field_button))
func _on_field_button_pressed(field_button) -> void:
	upgrade_resource_field(field_button)
