extends Node2D




func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu/main_menu.tscn")
