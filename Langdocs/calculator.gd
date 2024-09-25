extends Node2D

func add(num, onum) :
	return num+onum

func _on_add_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var added = add(num, onum)
	$Label2.text = "Operation: +"
	$Label4.text = "Result: " + str(added)

func sub(num, onum) :
	return num-onum
func _on_sub_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var subed = sub(num, onum)
	$Label2.text = "Operation: -"
	$Label4.text = "Result: " + str(subed)
	

func mul(num, onum) :
	return num*onum
func _on_mul_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var muled = mul(num, onum)
	$Label2.text = "Operation: *"
	$Label4.text = "Result: " + str(muled)

func mod(num, onum) :
	return num%onum
func _on_mod_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var moded = mod(num, onum)
	$Label2.text = "Operation: %"
	$Label4.text = "Result: " + str(moded)

func div(num, onum) :
	return num/onum
func _on_div_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var dived = div(num, onum)
	$Label2.text = "Operation: /"
	$Label4.text = "Result: " + str(dived)

func mpow(num, onum) :
	return num**onum
func _on_pow_pressed() -> void:
	var num = int($LineEdit.text)
	var onum = int($LineEdit2.text)
	var powed = pow(num, onum)
	$Label2.text = "Operation: **"
	$Label4.text = "Result: " + str(powed)


func _on_button_2_pressed() -> void:
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$Label2.text = "Operation: "
	$Label4.text = "Result: "


func _on_button_3_pressed() -> void:
	get_tree().quit()
