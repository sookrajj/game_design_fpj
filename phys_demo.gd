extends Node2D

var phys_ball = preload("res://phys_ball.tscn")
func _ready() -> void:
	$Panel/gravslider.value = $phys_ball.gravity_scale

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var nball = phys_ball.instantiate()
		nball.position = event.position
		nball.gravity_scale = $Panel/gravslider.value
		nball.inertia = float($Panel/Inertia.text)
		nball.linear_velocity = Vector2(float($Panel/Xchange.text), float($Panel/Ychange.text))
		add_child(nball)
func _on_gravslider_value_changed(value: float) -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value

func _on_ap_fo_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(50, 1000)
			child.apply_central_impulse(Vector2(1, 0) * force)


func _on_ap_ad_pressed() -> void:
	var iner = float($Panel/Inertia.text)
	var v_x = float($Panel/Xchange.text)
	var v_y = float($Panel/Ychange.text)
	var velocity = Vector2(v_x, v_y)
	var mass = float($Panel/mass.text)
	var crv = Vector2(float($Panel/Xchange2.text), float($Panel/Ychange2.text))
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = iner
			child.linear_velocity = velocity
			#child.mass = mass
			child.linear_velocity = Vector2(child.linear_velocity.x*crv.y, child.linear_velocity.y*crv.x)
