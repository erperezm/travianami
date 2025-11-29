extends Node2D

@onready var mouse_grid_selected: Sprite2D = $MouseGridSelected
#villageData
@onready var name_data: Label = $villageData/name/nameData
@onready var location_data: Label = $villageData/location/locationData
@onready var field_amount_data: Label = $villageData/fieldAmount/fieldAmountData
#resourceAmount
@onready var food_data: Label = $resourceAmount/food/foodData
@onready var water_data: Label = $resourceAmount/water/waterData
@onready var metal_data: Label = $resourceAmount/metal/metalData
@onready var wood_data: Label = $resourceAmount/wood/woodData
#productionPerHour
@onready var food_data_pph: Label = $productionPerHour/food/foodDataPPH
@onready var water_data_pph: Label = $productionPerHour/water/waterDataPPH
@onready var metal_data_pph: Label = $productionPerHour/metal/metalDataPPH
@onready var wood_data_pph: Label = $productionPerHour/wood/woodDataPPH
#maxResourceAmount
@onready var food_data_mra: Label = $maxResourceAmount/food/foodDataMRA
@onready var water_data_mra: Label = $maxResourceAmount/water/waterDataMRA
@onready var metal_data_mra: Label = $maxResourceAmount/metal/metalDataMRA
@onready var wood_data_mra: Label = $maxResourceAmount/wood/woodDataMRA
const VILLAGE = 2
var GridSize = 4
var Dic = {}

func _ready() -> void:
	setdata()
var wait3s = false
func _process(_delta: float) -> void:
	if(HttpRequest_G.loaded):
		if wait3s:
		#print("waiting  seconds")
			return
		else:
			wait3s = true
			await get_tree().create_timer(3.0).timeout # wait for 1 second
			setdata()
			print("se actualizo la villa de nuevo")
			wait3s = false


func setdata():
	if(HttpRequest_G.loaded):
		print("listo desde la villa")
		#villageData
		name_data.text = str(HttpRequest_G.villages[VILLAGE].name)
		location_data.text = str(0)
		field_amount_data.text = str(HttpRequest_G.villages[VILLAGE].resourcesCuantity)
		#resourceAmount
		food_data.text = str(HttpRequest_G.villages[VILLAGE].resourceAmount.food).split(".", true, 0)[0]
		water_data.text = str(HttpRequest_G.villages[VILLAGE].resourceAmount.water).split(".", true, 0)[0]
		metal_data.text = str(HttpRequest_G.villages[VILLAGE].resourceAmount.metal).split(".", true, 0)[0]
		wood_data.text = str(HttpRequest_G.villages[VILLAGE].resourceAmount.wood).split(".", true, 0)[0]
		#productionPerHour
		food_data_pph.text = str(HttpRequest_G.villages[VILLAGE].resourcePerHour.food)
		water_data_pph.text = str(HttpRequest_G.villages[VILLAGE].resourcePerHour.water)
		metal_data_pph.text = str(HttpRequest_G.villages[VILLAGE].resourcePerHour.metal)
		wood_data_pph.text = str(HttpRequest_G.villages[VILLAGE].resourcePerHour.wood)
		#maxResourceAmount
		food_data_mra.text = str(HttpRequest_G.villages[VILLAGE].maxResourceAmount.food)
		water_data_mra.text = str(HttpRequest_G.villages[VILLAGE].maxResourceAmount.water)
		metal_data_mra.text = str(HttpRequest_G.villages[VILLAGE].maxResourceAmount.metal)
		wood_data_mra.text = str(HttpRequest_G.villages[VILLAGE].maxResourceAmount.wood)
