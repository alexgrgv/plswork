extends AudioStreamPlayer

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/news/news_3.tscn")
