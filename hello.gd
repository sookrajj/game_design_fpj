extends Node2D

static var cnt = 0

func _on_button_pressed() -> void:
	$Label.text = "Hello, world!"
	cnt += 1
	$Label2.text = cnt




func _on_button_2_pressed() -> void:
	$Label.text = ""
