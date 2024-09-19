extends Node2D


func _on_button_pressed() -> void:
	$ItemList.add_item("Number    Square    Square Root    Cube    4th Root")
	for lcv in range(1, 21) :
		$ItemList.add_item(str(lcv) + "    " + str(pow(lcv, 2)) + "    " + str(round(10000 * pow(lcv, .5))/10000) + "    " + str(pow(lcv, 3)) + "    " + str(round(10000 * pow(lcv, .25))/10000))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
