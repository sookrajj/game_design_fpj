extends BaseItem

func _init():
	super._init()

func interact(player):
	player.pickup_container()
	remove()
