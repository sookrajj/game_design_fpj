extends Node2D



func _on_calc_pressed() -> void:
	var base = round(int($Kilo.text) *4.75)/100
	$Base.text = str(base)
	var sur = base * 0.1
	$Sur.text = str(sur)
	var city = base *.03
	$City.text = str(city)
	var pay = sur+city+base
	$Pay.text = str(pay)
	var late = pay*1.04
	$Late.text = str(late)


func _on_clear_pressed() -> void:
	$Kilo.text = ""
	$Base.text = ""
	$Sur.text = ""
	$City.text = ""
	$Pay.text = ""
	$Late.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
