extends Node

var is_dragging=false
var dragging_relative_position=Vector2i.ZERO
#Vector2和Vector2i都是xy轴的二维向量，前者使用的是浮点数，后者是整数,屏幕上的像素显然不存在.5这种，所以用后者

func _process(delta: float) -> void:
	if is_dragging:
		var current_window=get_window()   #获取当前根节点窗口对象
		current_window.position=DisplayServer.mouse_get_position()-dragging_relative_position
		#获取鼠标当前在整个电脑屏幕上的绝对像素坐标

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				is_dragging=true
				var current_window=get_window()
				dragging_relative_position=DisplayServer.mouse_get_position()-current_window.position
			else:
				is_dragging=false
