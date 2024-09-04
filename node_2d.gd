extends Node2D




func _on_button_pressed() -> void:
	$Label.text = "I am a sophmore, I have taken AP comp sci java A\nI like all my teachers and love computers in general."


func _on_button_2_pressed() -> void:
	$Label.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
