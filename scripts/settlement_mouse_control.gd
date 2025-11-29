extends TileMapLayer

var GridSize = 4
var Dic = {}
@onready var tile_map_world: TileMapLayer = $"."
@onready var mouse_grid_selected: Sprite2D = $"../MouseGridSelected"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouseCoords = local_to_map(get_local_mouse_position())
	var gridCoords = (mouseCoords * 16) + Vector2i(8,8)
	mouse_grid_selected.global_position = gridCoords
	
func get_mouse_coords():
	return local_to_map(get_local_mouse_position())

func get_zIndex():
	return tile_map_world.get_cell_tile_data(get_mouse_coords()).z_index
