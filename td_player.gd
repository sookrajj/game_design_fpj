extends CharacterBody2D


const SPEED = 125.0
const MAX_OBTAINABLE_HEALTH = 400.0
enum STATES {IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING}

@export var data = {
	"max_health" : 60.0, #20 hp per heart, 5 per fraction
	"healt" : 60, # min 60 max 400
	"money" : 0,
	"state" : STATES.IDLE,
	"secondaries" : [],
}

var inertia = Vector2()
var look_direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"), 
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0:
		look_direction = direction
		#Scale to 1 to prevent speed boost
		direction = direction.normalized()
		self.velocity = direction*SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	velocity += inertia
	update_animation(direction)
	move_and_slide()
	inertia = inertia.move_toward(Vector2.ZERO, delta*1000.0)
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true
	

func update_animation(direction):
	var aname = "idle_"
	if direction.length() > 0:
		aname = "walk_"
	if look_direction.x != 0: 
		aname += "side"
		$AnimatedSprite2D.flip_h = look_direction.x < 0
	elif look_direction.y < 0:
		aname += "up"
	#else:
		#aname += "down"
	elif look_direction.y > 0:
		aname += "down"
	$AnimatedSprite2D.animation = aname
	$AnimatedSprite2D.play()
	pass
