extends Node

var coorx = 0
var coory = 0
var data = {}

func set_player(body):
	data = body
	

func set_cords(coorx, coory):
	self.coorx = coorx
	self.coory = coory

func get_cords():
	var corx = coorx
	var cory = coory
	coorx = 0
	coory = 0
	return Vector2(corx, cory)

func get_data():
	return data
