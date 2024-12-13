extends Node2D
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
		name_data.text = str(HttpRequest_G.villages[0].name)
		location_data.text = str(0)
		field_amount_data.text = str(HttpRequest_G.villages[0].resourcesCuantity)
		#resourceAmount
		food_data.text = str(HttpRequest_G.villages[0].resourceAmount.food).split(".", true, 0)[0]
		water_data.text = str(HttpRequest_G.villages[0].resourceAmount.water).split(".", true, 0)[0]
		metal_data.text = str(HttpRequest_G.villages[0].resourceAmount.metal).split(".", true, 0)[0]
		wood_data.text = str(HttpRequest_G.villages[0].resourceAmount.wood).split(".", true, 0)[0]
		#productionPerHour
		food_data_pph.text = str(HttpRequest_G.villages[0].resourcePerHour.food)
		water_data_pph.text = str(HttpRequest_G.villages[0].resourcePerHour.water)
		metal_data_pph.text = str(HttpRequest_G.villages[0].resourcePerHour.metal)
		wood_data_pph.text = str(HttpRequest_G.villages[0].resourcePerHour.wood)
		#maxResourceAmount
		food_data_mra.text = str(HttpRequest_G.villages[0].maxResourceAmount.food)
		water_data_mra.text = str(HttpRequest_G.villages[0].maxResourceAmount.water)
		metal_data_mra.text = str(HttpRequest_G.villages[0].maxResourceAmount.metal)
		wood_data_mra.text = str(HttpRequest_G.villages[0].maxResourceAmount.wood)
