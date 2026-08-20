extends RayCast3D

# Show the pointer when the player aims at something they can select.
@export_group("Scene References")
@export var pointer_mesh: MeshInstance3D

@export_group("Selection Filter")
@export_subgroup("Groups")
@export var pickable_group: StringName = &"Pickable"


func _physics_process(_delta):
	if pointer_mesh == null:
		return
	pointer_mesh.visible = _is_pointing_at_pickable()


func _is_pointing_at_pickable():
	if !is_colliding():
		return false

	var node = get_collider() as Node

	while node != null:
		if node.is_in_group(pickable_group):
			return true
		node = node.get_parent()

	return false
