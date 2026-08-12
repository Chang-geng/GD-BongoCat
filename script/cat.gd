extends Control

enum CatState{BODY_POSE,ARM_POSE}

var current_state=CatState.BODY_POSE
@export var catbody:TextureRect
@export var catarm:TextureRect
@export var body_normal:Texture2D
@export var body_pressed:Texture2D
@export var arm_normal:Texture2D
@export var arm_pressed:Texture2D

func _process(delta: float) -> void:
	if GlobalInput.is_global_input_just_pressed("key"):
		set_cat_pressed(true)
	elif GlobalInput.is_global_input_just_released("key"):
		set_cat_pressed(false)

func set_cat_pressed(pressed:bool):
	if pressed:
		match current_state:
			CatState.BODY_POSE:
				catbody.texture=body_pressed
				catarm.texture=arm_normal
				current_state=CatState.ARM_POSE
			CatState.ARM_POSE:
				catbody.texture=body_normal
				catarm.texture=arm_pressed
				current_state=CatState.BODY_POSE
	else:
		catbody.texture=body_normal
		catarm.texture=arm_normal
