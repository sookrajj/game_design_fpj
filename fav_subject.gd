extends Node2D




func _on_button_pressed() -> void:
	$Label.text = "Computer Science and Math"


func _on_button_2_pressed() -> void:
	$Label.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
