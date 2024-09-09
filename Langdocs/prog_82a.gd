extends Node2D



func _on_button_pressed() -> void:
	var speedLimit = int($txtLim.text)
	var carSpeed = int($txtSpd.text)
	var milesOver = (carSpeed-speedLimit)
	var tic = 20.0 + (milesOver * 5.00)
	$ticketworth.text = "$ %.2f" % tic


func _on_button_2_pressed() -> void:
	$ticketworth.text = ""
	$txtLim.text = ""
	$txtSpd.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
