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
			var timer = get_tree().create_timer(10)
			#var ns = load(level)
			get_tree().change_scene_to_file(level)
			#for player in get_tree().get_nodes_in_group("Player"):
				#if player != null:
			#print(str(ns), "  ", str(get_tree()))
			print(str(timer))
			await timer.timeout
			print(str(get_tree()))
			if get_tree() != null:
				print("hi")
			#var playe = get_tree().get_instance_id()
			#print(str(playe))
			#playe.data = plar
			#playe.global_position = playe.global_position + Vector2(coorx, coory)
