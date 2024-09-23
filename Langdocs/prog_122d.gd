extends Node2D



func _on_button_pressed() -> void:
	for lcv in range(-12, 17) :
		$ItemList.add_item(str(lcv**6 + -3*lcv**5 -93*lcv**4 + 87*lcv**3 + 1596*lcv**2 - 1380*lcv - 2800))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
