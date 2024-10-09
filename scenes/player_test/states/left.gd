extends CommonFeaturesState


func on_input(event):
	if Input.is_action_just_pressed("ui_left"): 
		state_machine.change_to("Right")#name of the node
