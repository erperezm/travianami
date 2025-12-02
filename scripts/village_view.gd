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


func _process(_delta: float) -> void:
	setdata()


func setdata():
	if(ENV.player_village):
		#villageData
		field_amount_data.text = str(ENV.player_village.resourcesCuantity)
		location_data.text = str(ENV.player_village.name)
		name_data.text = str(ENV.player_village.name)
		#resourceAmount
		food_data.text = str( "%.2f" %float(ENV.player_village.resourceAmount.food))
		water_data.text = str( "%.2f" %float(ENV.player_village.resourceAmount.water))
		metal_data.text = str( "%.2f" %float(ENV.player_village.resourceAmount.metal))
		wood_data.text = str( "%.2f" %float(ENV.player_village.resourceAmount.wood))
		#productionPerHour
		food_data_pph.text = str(int(ENV.player_village.resourcePerHour.food))
		water_data_pph.text = str(int(ENV.player_village.resourcePerHour.water))
		metal_data_pph.text = str(int(ENV.player_village.resourcePerHour.metal))
		wood_data_pph.text = str(int(ENV.player_village.resourcePerHour.wood))
		#maxResourceAmount
		food_data_mra.text = str(int(ENV.player_village.maxResourceAmount.food))
		water_data_mra.text = str(int(ENV.player_village.maxResourceAmount.water))
		metal_data_mra.text = str(int(ENV.player_village.maxResourceAmount.metal))
		wood_data_mra.text = str(int(ENV.player_village.maxResourceAmount.wood))
