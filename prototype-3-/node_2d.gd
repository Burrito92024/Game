extends Node2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Get current scene path
		var current_scene_file = get_tree().current_scene.scene_file_path

		# Extract level number (assumes filename is like "level1.tscn")
		var current_level_number = current_scene_file.get_file().trim_suffix(".tscn").trim_prefix("level")
		var next_level_number = int(current_level_number) + 1

		# Create next level path
		var next_level_path = "res://lvl_" + str(next_level_number) + ".tscn"

		# Change to next scene
		get_tree().change_scene_to_file(next_level_path)
