extends Node2D


func _on_show_pressed() -> void:
	var a = int($A.text)
	var b = int($B.text)
	var c = int($C.text)
	var root = (-b + (b ** 2 - 4*a*c) ** .5)/(2*a)
	var oroot = (-b - (b ** 2 - 4*a*c) ** .5)/(2*a)
	$Label2.text = "The roots are: " + str(root) + ", " + str(oroot)


func _on_clear_pressed() -> void:
	$Label2.text = "The roots are: "
	$A.text = ""
	$B.text = ""
	$C.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
