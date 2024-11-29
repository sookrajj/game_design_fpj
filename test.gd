extends Node

var coorx = 0
var coory = 0
var data = {}
var collectstd = {
	"mini_heart" : false,
	"miniHeart2" : false,
	"miniHeart3" : false,
	"miniHeart4" : false,
	"coin" : false,
	"coin2" : false,
	"coin3" : false,
	"coin4" : false,
	"coin5" : false,
	"coin6" : false,
	"coin7" : false,
	"coin8" : false,
	"coin9" : false,
	"coin10" : false,
	"coin11" : false,
	"coin12" : false,
	"coin13" : false,
	"heart_container" : false,
	"heart_container2" : false,
	"heart_container3" : false,
	"SmallChest2" : false,
	"SmallChest3" : false,
	"SmallChest4" : false,
	"SmallChest5" : false,
	"SmallChest6" : false,
	"SmallChest7" : false,
	"SmallChest8" : false,
	"SmallChest9" : false,
	"SmallChest10" : false,
	"SmallChest11" : false,
	"SmallChest12" : false,
	"SmallChest13" : false,
	"SmallChest14" : false,
	"td_enemy" : false,
	"td_enemy2" : false,
	"td_enemy3" : false,
	"td_enemy4" : false,
	"td_enemy5" : false,
	"td_enemy6" : false,
	"td_enemy7" : false,
	"td_enemy8" : false,
	"td_enemy9" : false,
	"td_enemy10" : false,
	"td_enemy11" : false,
	"td_enemy12" : false,
	"td_enemy13" : false,
	"td_enemy14" : false,
	"td_enemy15" : false,
	"td_enemy16" : false,
	"td_enemy17" : false,
	"td_enemy18" : false,
	"td_enemy19" : false,
	"td_enemy20" : false,
	"td_enemy21" : false,
	"td_enemy22" : false,
	"td_enemy23" : false,
	"td_enemy24" : false,
	"td_enemy25" : false,
	"td_enemy26" : false,
}

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
