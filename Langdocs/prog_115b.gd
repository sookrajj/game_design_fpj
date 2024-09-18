extends Node2D


func _on_button_pressed() -> void:
	for lcv in range(1, 19) :
		$Label.text = $Label.text + str(lcv *2) + " "
		


func _on_button_2_pressed() -> void:
	$Label.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
