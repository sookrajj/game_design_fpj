extends Node2D


func _on_btnshow_pressed() -> void:
	$Label.text = "Jonah Sookraj"


func _on_btnclear_pressed() -> void:
	$Label.text = ""


func _on_btnexit_pressed() -> void:
	get_tree().quit()
