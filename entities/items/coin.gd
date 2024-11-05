extends BaseItem

func _init():
	super._init(10)

func interact(player):
	player.pickup_money(value)
	remove()
