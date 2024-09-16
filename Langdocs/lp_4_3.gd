extends Node2D



func _on_button_4_pressed() -> void:
	var eggs = int($LineEdit.text)
	var dozen = floor(eggs/12)
	var remaining = eggs % 12
	var worth = 0.0
	if dozen > 0 && dozen < 4:
		worth = 0.50
	elif dozen >= 4 && dozen < 6:
		worth = 0.45
	elif dozen >= 6 && dozen < 11:
		worth = 0.40
	elif dozen >= 11:
		worth = 0.35
	else:
		$Label2.text = "Stop trying to return eggs"
		return;
	$Label2.text = "The bill is equal to: $" + str((round((worth*dozen + remaining * worth / 12) * 100) /100))


func _on_button_5_pressed() -> void:
	$LineEdit.text = ""
	$Label2.text = ""


func _on_button_6_pressed() -> void:
	get_tree().quit()
