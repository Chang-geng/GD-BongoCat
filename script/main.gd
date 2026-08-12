extends Control

@export var collision_polygon:CollisionPolygon2D
@export var popup_menu:PopupMenu

func _ready() -> void:
	if collision_polygon:
		var points:PackedVector2Array=collision_polygon.polygon
		DisplayServer.window_set_mouse_passthrough(points)
		#设置游戏窗口中，有哪些区域是允许鼠标直接穿透
	if popup_menu:
		popup_menu.id_pressed.connect(_on_popup_menu_id_pressed)

func _on_popup_menu_id_pressed(id:int):
	if id==0:
		get_tree().quit()
