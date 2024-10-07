class_name CommonFeaturesState extends Node

@onready var controlled_node:Node = self.owner

var state_machine:StateMachine




#region common methods
#execute before node start
func start():
	pass
#execute after node end
func end():
	pass
	
#endregion
