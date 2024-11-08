extends TileMapLayer

@onready var tile_map_world: TileMapLayer = $"."
@onready var mouse_grid_selected: Sprite2D = $"../MouseGridSelected"

@onready var data_wood: Label = $"../Wood/dataWood"
@onready var data_food: Label = $"../Food/dataFood"
@onready var data_water: Label = $"../Water/dataWater"
@onready var data_metal: Label = $"../Metal/dataMetal"
@onready var data_name: Label = $"../Name/dataName"

var GridSize = 4
var Dic = {}
var VillageLoaded = false
var Villages = null
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
			print("MouseCoords: ", get_mouse_coords())
			print("Terrain type: ", get_z_index())
			print(get_village_index())
			if(VillageLoaded):
				show_village_data()
			else:
				print("loading villages")
			
func show_village_data():
	data_wood.text = str(Villages[get_village_index()].resourcesCuantity.wood)
	data_food.text = str(Villages[get_village_index()].resourcesCuantity.food)
	data_water.text = str(Villages[get_village_index()].resourcesCuantity.water)
	data_metal.text = str(Villages[get_village_index()].resourcesCuantity.metal)
	data_name.text	= str(Villages[get_village_index()].name)
	
func get_mouse_coords():
	return local_to_map(get_local_mouse_position())
	
func get_zIndex():
	return tile_map_world.get_cell_tile_data(get_mouse_coords()).z_index
	
func get_village_index():
	#16 is the height of the world map
	return get_mouse_coords().x * 16 + get_mouse_coords().y


	


func _on_http_request_data_loaded(villages: Variant) -> void:
	VillageLoaded = true
	Villages=villages
	
