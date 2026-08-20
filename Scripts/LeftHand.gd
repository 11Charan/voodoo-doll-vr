extends XRController3D

@export_group("OpenXR Actions")
@export_subgroup("Customization")
@export var change_color_action: StringName = &"trigger_click"
@export_subgroup("Selection")
@export var finish_selection_action: StringName = &"primary_click"

var previous_button_states = {}


func _process(_delta):
	if _was_just_pressed(change_color_action):
		ObjectManager.cycle_color()
	if _was_just_pressed(finish_selection_action):
		ObjectManager.clear()


func _was_just_pressed(action):
	var pressed_now = is_button_pressed(action)
	var pressed_before = previous_button_states.get(action, false)
	previous_button_states[action] = pressed_now

	return pressed_now and !pressed_before
