extends CanvasLayer

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var hearts = $player_health/Hearts

const HEART_ROW_SIZE = 10
const HEART_OFFSET = 16

func create_heart():
	var newheart = Sprite2D.new()
	newheart.texture = hearts.texture
	newheart.hframes = hearts.hframes
	newheart.vframes = hearts.vframes
	newheart.frame = 8
	hearts.add_child(newheart)

func draw_hearts():
	for heart in hearts.get_children():
		hearts.remove_child(heart)
	for i in range(int(player.data.max_health)/20):
		create_heart() # 1 heart per 20 hp

func _ready() -> void:
	draw_hearts()


func _process(delta: float) -> void:
	var ph = player.data.health
	var fh = floor(ph/20)
	var rh = int(ph)%20
	for heart in hearts.get_children():
		var index = heart.get_index()
		var x = (index%HEART_ROW_SIZE) * HEART_OFFSET
		var y = (index/HEART_ROW_SIZE) * HEART_OFFSET
		heart.position = Vector2(x, y)
		
		# frames 8 = empty, 7 1/4, 6 1/2, 3 3/4, 4 full
		if index > fh:
			heart.frame = 8
		elif index == fh:
			heart.frame = 8 - int(rh/5)
		elif index < fh:
			heart.frame = 4
	pass
