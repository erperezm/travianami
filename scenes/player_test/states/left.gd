extends CommonFeaturesState


func on_input(event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_pressed("ui_left"): 
		state_machine.change_to("Right")
		print("right")
