extends Node

@export_group("Color Customization")
@export_subgroup("Palette")
@export var colors: Array[Color] = [
	Color(0.15, 0.65, 1.0), Color(1.0, 0.25, 0.2),
	Color(0.25, 0.9, 0.35), Color(1.0, 0.65, 0.1),
	Color(0.75, 0.3, 1.0), Color(0.95, 0.95, 0.95)
]

var original: Node3D
var doll: Node3D
var original_scale = Vector3.ONE
var doll_display_scale = 0.3
var scale_factor = 1.0
var color_index = -1
var customization_status = ""

func select(original_object, doll_object, display_scale):
	clear()
	original = original_object
	doll = doll_object
	original_scale = original.scale
	doll_display_scale = display_scale
	scale_factor = 1.0
	color_index = -1
	doll.scale = Vector3.ONE * doll_display_scale
	customization_status = ""

func change_scale(amount, minimum, maximum):
	scale_factor = clampf(scale_factor + amount, minimum, maximum)
	original.scale = original_scale * scale_factor
	doll.scale = Vector3.ONE * doll_display_scale * scale_factor
	customization_status = "Size: %d%%" % roundi(scale_factor * 100.0)

func cycle_color():
	color_index = (color_index + 1) % colors.size()
	var material = StandardMaterial3D.new()
	material.albedo_color = colors[color_index]
	_apply_material(original, material)
	_apply_material(doll, material)
	customization_status = "Color %d of %d" % [color_index + 1, colors.size()]

func _apply_material(node, material):
	if node == null:
		return
	if node is MeshInstance3D:
		node.material_override = material

	for child in node.get_children():
		_apply_material(child, material)

func clear():
	if is_instance_valid(doll):
		doll.queue_free()

	original = null
	doll = null
	customization_status = ""

func has_selection():
	return is_instance_valid(original) and is_instance_valid(doll)
