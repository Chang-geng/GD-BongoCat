extends Node

const FILE_PATH="user://config.ini"

var window_position=Vector2i.ZERO

func _enter_tree() -> void:
	var config=ConfigFile.new()
	if config.load(FILE_PATH)==OK:   #默认存档文件不存在，这里用判断来处理防止崩溃
		window_position=config.get_value("General","WindowPosition",Vector2i.ZERO)
		get_window().position=window_position

func _exit_tree() -> void:
	window_position=get_window().position
	var config=ConfigFile.new()
	config.set_value("General","WindowPosition",window_position)
	config.save(FILE_PATH)   #存入文件，不存在自动创建
