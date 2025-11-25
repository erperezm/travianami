extends CanvasLayer

func _on_map_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/world_map.tscn"))
func _on_village_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/village_view.tscn"))
