extends Area2D

@export var next_level = ""
@export var coorx = 0
@export var coory = 0




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if next_level == "":
			OS.alert("No next level!")
		else:
			var level = "res://" + next_level + ".tscn"
			var plar = body.data
			#var ns = load(level)
			get_tree().change_scene_to_file(level)
			if get_tree() != null:
				print("hi")
			#var playe = get_tree().get_instance_id()
			#playe.data = plar
			#playe.global_position = playe.global_position + Vector2(coorx, coory)


func new_scene(plar):
	var playe = get_tree().get_instance_id()
	playe.data = plar
	playe.global_position = playe.global_position + Vector2(coorx, coory)
