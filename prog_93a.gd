extends Node2D



func _on_calc_pressed() -> void:
	var base = round(int($Kilo.text) *4.75)/100
	$Base.text = "$" + str(base)
	var sur = base * 0.1
	$Sur.text = "$" + str(sur)
	var city = round(base *.03*100)/100
	$City.text = "$" + str(city)
	var pay = round((sur+city+base)*100)/100
	$Pay.text = "$" + str(pay)
	var late = round(pay*1.04*100)/100
	$Late.text = "$" + str(late)


func _on_clear_pressed() -> void:
	$Kilo.text = ""
	$Base.text = ""
	$Sur.text = ""
	$City.text = ""
	$Pay.text = ""
	$Late.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
