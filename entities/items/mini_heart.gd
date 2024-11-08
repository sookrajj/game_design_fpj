extends BaseItem

func _init():
	super._init(int(round(randi()*20)))

func interact(player):
	player.pickup_health(value)
	remove()
