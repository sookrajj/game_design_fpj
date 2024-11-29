class_name BaseItem extends Node2D

var value
var bounce = true

var flicker_state = false
var flicker_start = 10.0
var flicker_interval = 0.1
var current_time = 0.0
var time_to_despawn = 13.0

func remove():
	value = 0
	queue_free()

func interact(player):
	""" TODO: to be implemented by child class """
	#player.pickup_item(value)
	remove()

func _init(default_value: int = 1):
	value = default_value

func _physics_process(delta: float) -> void:
	if !Test.collectstd.has(self.name) or !Test.collectstd[self.name]:
		for player in get_tree().get_nodes_in_group("Player"):
			if $Area2D.overlaps_body(player):
				interact(player)
				if Test.collectstd.has(self.name) and self.name != "coin" and self.name != "mini_heart" and self.name != "heart_container":
					Test.collectstd[self.name] = true
		current_time += delta
		if current_time >= flicker_start and current_time <= time_to_despawn:
			$AnimatedSprite2D.visible = fmod(current_time, flicker_interval) < (flicker_interval/2)
		if current_time >= time_to_despawn:
			remove()
	else:
		queue_free()
	

func _ready():
	if !Test.collectstd.has(self.name) or !Test.collectstd[self.name]: 
		$AnimatedSprite2D.play()
		if bounce:
			var tween = get_tree().create_tween()
			var bh = Vector2(0, -3)
			tween.set_trans(Tween.TRANS_BOUNCE)
			tween.set_ease(Tween.EASE_OUT)
			tween.tween_property($AnimatedSprite2D, "global_position", self.global_position + bh, 0.1)
			tween.play()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property($AnimatedSprite2D, "global_position", self.global_position, 0.1)
			tween.play()
	else:
		queue_free()
