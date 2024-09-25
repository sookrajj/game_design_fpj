extends Node2D

func sayHi() :
	print("Hello, world!")

func getArea(len: int, wid : int) -> int :
	return len*wid
func getPerimeter(len, wid) :
	return len*2+2*wid
func _on_button_pressed() -> void:
	sayHi()
	var len = int($LineEdit.text)
	var wid = int($LineEdit2.text)
	$Label3.text = "Area: " + str(getArea(len, wid))
	$Label4.text = "Perimeter: " + str(getPerimeter(len, wid))


func _on_button_2_pressed() -> void:
	$Label3.text = "Area: "
	$Label4.text = "Perimeter: "
	$LineEdit.text = ""
	$LineEdit2.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
