extends Node2D



func _on_button_pressed() -> void:
	var lcv = 3
	var sum = 0
	while (lcv <= 9669) :
		sum += lcv
		$ItemList.add_item(str(sum))
		lcv += 3

func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
