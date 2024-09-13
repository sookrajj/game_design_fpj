extends Node2D



func _on_button_4_pressed() -> void:
	var copies = int($LineEdit.text)
	var price = 0.0;
	var tcost = 0.0;
	if copies > 0 && copies < 100:
		price = 0.30
		tcost = copies*price
	elif copies > 99 && copies < 500: 
		price = 0.28
		tcost = copies*price
	elif copies > 499 && copies < 750:
		price = 0.27
		tcost = copies*price
	elif copies > 749 && copies < 1000:
		price = 0.26
		tcost = price*copies
	elif copies > 999:
		price = 0.25
		tcost = copies*price
	else:
		$label2.text = "Invalid # of copies"
		$Label3.text = ""
		return;
	$Label2.text = "Price per copy: $" + str(price)
	$Label3.text = "total cost: $" + str(tcost)


func _on_button_5_pressed() -> void:
	$Label2.text = "Price per copy: $"
	$Label3.text = "total cost: $"
	$LineEdit.text = "";


func _on_button_6_pressed() -> void:
	get_tree().quit()
