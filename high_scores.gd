extends Control

var highscores = [28, 7, 15]

func update_scoreboard():
	$ItemList.clear()
	highscores.sort()
	#for score in highscores:
		#$ItemList.add_item(str(score))
	for lcv in range(len(highscores)):
		$ItemList.add_item("%d. %d" % [lcv+1, highscores[lcv]])


func _ready() -> void:
	update_scoreboard()
	


func _on_button_pressed() -> void:
	var newnum = int($LineEdit.text)
	highscores.append(newnum)
	update_scoreboard()


func _on_button_2_pressed() -> void:
	var renum = int($LineEdit2.text)-1
	#var place = -1
	#for lcv in range(len(highscores)):
		#if highscores[lcv] == renum:
			#place = lcv
	highscores.remove_at(renum)
	update_scoreboard()
