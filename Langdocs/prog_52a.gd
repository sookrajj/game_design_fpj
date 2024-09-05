extends Node2D


func _on_calcbtn_pressed() -> void:
	var len = int($LElen.text)
	var wid = int($LEwid.text)
	var ar = len*wid
	var per = len*2 + wid*2
	$area.text = "Area: " + str(ar)
	$perim.text = "Perimeter: " + str(per)
	# Operators: + - * / %    ** pow
	#float - floating point number (w/ decimal)


func _on_clearbtn_pressed() -> void:
	$LElen.text = ""
	$LEwid.text = ""
	$area.text = ""
	$perim.text = ""


func _on_exitbtn_pressed() -> void:
	get_tree().quit()
