extends BaseItem

func _init():
	super._init(int(round(randf()*20)))

func interact(player):
	player.pickup_health(value)
	remove()
