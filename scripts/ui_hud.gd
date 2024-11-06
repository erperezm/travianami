extends CanvasLayer

const VILLAGE_VIEW = "res://scenes/village_view.tscn"
const MAP_VIEW = "res://scenes/world_map.tscn"

func _on_map_button_pressed() -> void:
	get_tree().change_scene_to_file(MAP_VIEW)


func _on_village_button_pressed() -> void:
	get_tree().change_scene_to_file(VILLAGE_VIEW)
