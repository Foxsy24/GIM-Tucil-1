extends Area2D
@export var next_level_unlock: int = 2

func _on_body_entered(body: Node2D) -> void:
	print("change level")
	body.get_node("CollisionShape2D").queue_free()
	get_tree().change_scene_to_file("res://main_menu.tscn")
