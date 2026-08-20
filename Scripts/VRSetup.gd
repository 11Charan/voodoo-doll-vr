extends XROrigin3D

@export_group("OpenXR Runtime")
@export_subgroup("Interface")
@export var xr_interface_type: StringName = &"OpenXR"
@export_subgroup("Rendering")
@export var disable_vsync_on_start = true
@export var enable_xr_viewport = true

func _ready():
	var xr_interface = XRServer.find_interface(xr_interface_type)

	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized.")

		if disable_vsync_on_start:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		get_viewport().use_xr = enable_xr_viewport
	else:
		push_error("OpenXR failed to initialize.")
