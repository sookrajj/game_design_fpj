extends Node2D


func _on_button_pressed() -> void:
	for lcv in range(1, 6) :
		var col1 = lcv*2
		var col2 = col1+1
		var col3 = col1*2
		var col4 = col1**2
		$ItemList.add_item(str(col1) + "    " + str(col2) + "    " + str(col3) + "    " + str(col4))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
