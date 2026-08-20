extends XRController3D

@export_group("Scene References")
@export var ray_cast: RayCast3D
@export var doll_anchor: Node3D

@export_group("Doll Customization")
@export_subgroup("Display")
@export_range(0.1, 1.0, 0.05) var default_doll_scale = 0.3

@export_subgroup("Size Constraints")
@export_range(0.1, 1.0, 0.05, "or_greater") var minimum_size = 0.5
@export_range(1.0, 3.0, 0.05, "or_greater") var maximum_size = 2.0
@export_range(0.01, 0.5, 0.01, "or_greater") var scale_step = 0.1

@export_group("OpenXR Actions")
@export_subgroup("Selection")
@export var select_action: StringName = &"trigger_click"
@export_subgroup("Resizing")
@export var increase_size_action: StringName = &"primary_click"
@export var decrease_size_action: StringName = &"primary_touch"

var previous_button_states = {}


func _process(_delta):
	if _was_just_pressed(select_action):
		_select_looked_at_object()
	if _was_just_pressed(increase_size_action):
		ObjectManager.change_scale(scale_step, minimum_size, maximum_size)
	if _was_just_pressed(decrease_size_action):
		ObjectManager.change_scale(-scale_step, minimum_size, maximum_size)


func _was_just_pressed(action):
	var pressed_now = is_button_pressed(action)
	var pressed_before = previous_button_states.get(action, false)
	previous_button_states[action] = pressed_now

	return pressed_now and !pressed_before


func _select_looked_at_object():
	if !ray_cast.is_colliding():
		return

	var picked = _find_pickable_parent(ray_cast.get_collider())
	if picked == null:
		return

	var doll = picked.duplicate() as Node3D
	if doll == null:
		return

	_prepare_doll(doll)
	doll_anchor.add_child(doll)
	doll.transform = Transform3D.IDENTITY
	ObjectManager.select(picked, doll, default_doll_scale)


func _find_pickable_parent(node):
	while node != null:
		if node is Node3D and node.is_in_group("Pickable"):
			return node
		node = node.get_parent()

	return null


func _prepare_doll(node):
	if node is CollisionObject3D:
		node.collision_layer = 0
		node.collision_mask = 0

	if node is CollisionShape3D:
		node.disabled = true

	if node.get_script() != null:
		node.set_script(null)

	for child in node.get_children():
		_prepare_doll(child)
