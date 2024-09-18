extends Node2D



func _on_button_pressed() -> void:
	$ItemList.add_item("Number")
	for lcv in range(18) :
		$ItemList.add_item(str(lcv*2+2))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
