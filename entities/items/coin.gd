extends BaseItem

func _init():
	super._init()

func interact(player):
	player.pickup_money(value)
	remove()
