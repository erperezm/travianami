extends TileMapLayer

@onready var tile_map_world: TileMapLayer = $"."
@onready var mouse_grid_selected: Sprite2D = $"../MouseGridSelected"

@onready var data_wood: Label = $"../Wood/dataWood"
@onready var data_food: Label = $"../Food/dataFood"
@onready var data_water: Label = $"../Water/dataWater"
@onready var data_metal: Label = $"../Metal/dataMetal"
@onready var data_name: Label = $"../Name/dataName"
@onready var data_terrain: Label = $"../Type/dataTerrain"

var GridSize = 4
var Dic = {}

func _ready() -> void:
	set_data()

func _physics_process(_delta: float) -> void:
	var mouseCoords = local_to_map(get_local_mouse_position())
	var gridCoords = (mouseCoords * 16) + Vector2i(8,8)
	mouse_grid_selected.global_position = gridCoords

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			set_data()

func set_data():
	if ENV.all_village:
		data_name.text = str(ENV.all_village[get_village_index()].name)
		data_wood.text = str(ENV.all_village[get_village_index()].resourcesCuantity.wood)
		data_food.text = str(ENV.all_village[get_village_index()].resourcesCuantity.food)
		data_water.text = str(ENV.all_village[get_village_index()].resourcesCuantity.water)
		data_metal.text = str(ENV.all_village[get_village_index()].resourcesCuantity.metal)
		data_terrain.text =  str(get_zIndex())

func get_mouse_coords():
	return local_to_map(get_local_mouse_position())

func get_zIndex():
	return tile_map_world.get_cell_tile_data(get_mouse_coords()).z_index

func get_village_index():
	#16 is the height of the world map
	#the expression transform vector in matrix
	return get_mouse_coords().x * 16 + get_mouse_coords().y
