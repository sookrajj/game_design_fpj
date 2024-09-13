extends Node2D



func _on_button_4_pressed() -> void:
	var weight = int($LineEdit.text)
	var length = int($LineEdit2.text)
	var width = int($LineEdit3.text)
	var height = int($LineEdit4.text)
	var area = length*width*height
	if weight > 27 && area > 100000:
		$Label5.text = "Too heavy and too large"
	elif weight > 27:
		$Label5.text = "Too heavy"
	elif area > 100000:
		$Label5.text = "Too large"
	else:
		$Label5.text = "It is fine"


func _on_button_5_pressed() -> void:
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$LineEdit3.text = ""
	$LineEdit4.text = ""
	$Label5.text = ""


func _on_button_6_pressed() -> void:
	get_tree().quit()
