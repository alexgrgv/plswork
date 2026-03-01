extends Node2D

@onready var glitch = $TextureRect2
@onready var news = $TextureRect
	
func _on_audio_stream_player_2d_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/days/day_4.tscn")

func _ready() -> void:
	Mmc.stop()
	news.visible = true
	glitch.visible = false
	
func _on_timer_timeout() -> void:
	news.visible = false
	glitch.visible = true
