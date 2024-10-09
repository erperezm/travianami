extends CommonFeaturesState

func on_input(event):
	if Input.is_action_just_pressed("ui_right"): 
		state_machine.change_to("Left")
