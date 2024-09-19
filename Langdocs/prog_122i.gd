extends Node2D



func _on_button_pressed() -> void:
	$ItemList.add_item("Number    Cube root    Cube")
	for lcv in range(-25, 26) :
		if (lcv >= 0) :
			$ItemList.add_item(str(lcv) + "    " + str(round(100000 * pow(lcv, (1.0/3.0)))/100000) + "    " + str(pow(lcv, 3)))
		else :
			$ItemList.add_item(str(lcv) + "    " + str(-1 * round(100000 * pow(abs(lcv), (1.0/3.0)))/100000) + "    " + str(-1 * pow(abs(lcv), 3)))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
