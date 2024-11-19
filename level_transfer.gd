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
			
			#get_tree().change_scene_to_file(level)
			get_tree().change_scene_to_file(level)
			#for player in get_tree().get_nodes_in_group("Player"):
				#if player != null:
			var player = get_tree().get_first_node_in_group("Player")
			player.data.max_health = plar.max_health
					#player.global_position = player.global_position + Vector2(coorx, coory)
