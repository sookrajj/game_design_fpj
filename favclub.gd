extends Node2D


func _on_btn_show_pressed() -> void:
	$Label.text = "Basketball and Tennis"


func _on_btn_clear_pressed() -> void:
	$Label.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
