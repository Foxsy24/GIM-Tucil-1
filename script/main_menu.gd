extends Control
@onready var btn_level_1 = $VBoxContainer/level1
@onready var btn_level_2 = $VBoxContainer/level2

func _ready() -> void:
	var SaveManager = get_node_or_null("/root/SaveManager")
	if SaveManager == null:
		print("ERROR: Autoload SaveManager benar-benar tidak terdeteksi!")
		return
		
	var unlocked_level = SaveManager.load_level()
	if unlocked_level < 2:
		btn_level_2.disabled = true
	else:
		btn_level_2.disabled = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level1.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level1.tscn")



func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://level2.tscn")
