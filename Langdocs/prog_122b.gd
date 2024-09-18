extends Node2D


func _on_button_pressed() -> void:
	$ItemList.add_item("Hours    Pay")
	for lcv in range(40) :
		$ItemList.add_item(str(lcv+1) + "      " + str((lcv+1)*4))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
