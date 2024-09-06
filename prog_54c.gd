extends Node2D



func _on_button_pressed() -> void:
	var num = float($LineEdit.text);
	var pi = 3.14159
	var area = round((num ** 2) * pi*100)/100
	var circ = round(num*2*pi*100)/100
	$Label2.text = "The Area of the circle: " + str(area)
	$Label3.text = "The Circumference of the circle: " + str(circ)
	


func _on_button_2_pressed() -> void:
	$LineEdit.text = ""
	$Label2.text = "The Area of the circle: "
	$Label3.text = "The Circumference of the circle: "


func _on_button_3_pressed() -> void:
	get_tree().quit()
