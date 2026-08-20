extends Label3D

@export_group("Tutorial Content")
@export_subgroup("Instructions")
@export_multiline var help_text = "VOODOO WORKSHOP\nRight trigger: select\nRight primary press/touch: resize\nLeft trigger: change color\nLeft primary: finish"
@export_subgroup("Status Messages")
@export var idle_message = "Aim at an object and press right trigger."
@export var selected_message = "Selected: %s\nChanges appear immediately."

func _process(_delta):
	if ObjectManager.has_selection():
		var object_name = ObjectManager.original.name
		if ObjectManager.customization_status.is_empty():
			text = help_text + "\n\n" + selected_message % object_name
		else:
			text = help_text + "\n\nSelected: %s\n%s" % [object_name, ObjectManager.customization_status]
	else:
		text = help_text + "\n\n" + idle_message
