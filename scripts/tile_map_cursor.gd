extends TileMapLayer

@onready var tile_map_world: TileMapLayer = $"."
@onready var mouse_grid_selected: Sprite2D = $"../MouseGridSelected"

var GridSize = 4
var Dic = {}

# Called when the node enters the scene tree for the first time. 
# Part of the code generation investigation - DO NOT DELETE YET
#func _ready() -> void:
	## Create the cell based on the sprite index
	#for x in GridSize:
		#for y in GridSize:
			#set_cell(Vector2(x, y), [index-here], Vector2i(0, 0))

func _physics_process(delta: float) -> void:
	var mouseCoords = local_to_map(get_local_mouse_position())
	var gridCoords = (mouseCoords * 16) + Vector2i(8,8)
	mouse_grid_selected.global_position = gridCoords

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var mouseCoords = local_to_map(get_local_mouse_position())
			var zIndex = tile_map_world.get_cell_tile_data(mouseCoords).z_index
			print("MouseCoords: ", mouseCoords)
			print("Terrain type: ", zIndex)
	
