extends Node2D



func _on_calcbtn_pressed() -> void:
	var num1 = int($LineEdit.text)
	var num2 = int($LineEdit2.text)
	var num3 = int($LineEdit3.text)
	var num4 = int($LineEdit4.text)
	var sum = num1 + num2 + num3 + num4
	var ave = (sum/4.0)
	$sumlbl.text = "Sum: " + str(sum)
	$avelbl.text = "Average: " + str(ave)



func _on_clearbtn_pressed() -> void:
	$sumlbl.text = "Sum: "
	$avelbl.text = "Average: "
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$LineEdit3.text = ""
	$LineEdit4.text = ""


func _on_exitbtn_pressed() -> void:
	get_tree().quit()