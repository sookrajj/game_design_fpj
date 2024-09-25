extends Node2D



func _on_add_pressed() -> void:
	$Label2.text = "Operation: +"
	$Label4.text = "Result: " + str(int($LineEdit.text) + int($LineEdit2.text))


func _on_sub_pressed() -> void:
	$Label2.text = "Operation: -"
	$Label4.text = "Result: " + str(int($LineEdit.text) - int($LineEdit2.text))


func _on_mul_pressed() -> void:
	$Label2.text = "Operation: *"
	$Label4.text = "Result: " + str(int($LineEdit.text) * int($LineEdit2.text))


func _on_mod_pressed() -> void:
	$Label2.text = "Operation: %"
	$Label4.text = "Result: " + str(int($LineEdit.text) % int($LineEdit2.text))


func _on_div_pressed() -> void:
	$Label2.text = "Operation: /"
	$Label4.text = "Result: " + str(int($LineEdit.text) / int($LineEdit2.text))


func _on_pow_pressed() -> void:
	$Label2.text = "Operation: **"
	$Label4.text = "Result: " + str(int($LineEdit.text) ** int($LineEdit2.text))


func _on_button_2_pressed() -> void:
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$Label2.text = "Operation: "
	$Label4.text = "Result: "


func _on_button_3_pressed() -> void:
	get_tree().quit()
