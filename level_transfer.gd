extends Area2D

@export var next_level = ""


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if next_level == "":
			OS.alert("No next level!")
		else:
			var level = "res://" + next_level + ".tscn"
			get_tree().change_scene_to_file(level)
