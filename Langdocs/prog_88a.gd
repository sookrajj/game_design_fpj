extends Node2D



func _on_button_pressed() -> void:
	var num1 = int($LineEdit.text)
	var num2 = int($LineEdit2.text)
	var Sum = num1 + num2;
	var Diff = num1 - num2;
	var Mult = num1*num2;
	var Ave = Sum/2;
	var Abs = abs(num1-num2)
	var Max = max(num1, num2)
	var Min = min(num1, num2)
	if num1 > num2 : 
		Max = num1
	else : Max = num2
	if Max == num1 :
		Min = num2
	else:
		Min = num1
	$Label.text = ("Sum: " + str(Sum)
	 + "\nDifference: " + str(Diff)
	 + "\nMultiply: " + str(Mult)
	 + "\nAverage: " + str(Ave)
	 + "\nAbsolute value: " + str(Abs)
	 + "\nMaximum: " + str(Max)
	 + "\nMinimum: " + str(Min))


func _on_button_2_pressed() -> void:
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$Label.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
