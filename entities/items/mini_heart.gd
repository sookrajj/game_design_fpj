extends BaseItem

func _init():
	super._init(5)

func interact(player):
	player.pickup_health(value)
	remove()
