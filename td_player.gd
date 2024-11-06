extends CharacterBody2D


const SPEED = 125.0
const MAX_OBTAINABLE_HEALTH = 400.0
enum STATES {IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING}

@export var data = {
	"max_health" : 60.0, #20 hp per heart, 5 per fraction
	"health" : 45.0, # min 60 max 400
	"max_money" : 999,
	"money" : 0,
	"state" : STATES.IDLE,
	"secondaries" : [],
}

var inertia = Vector2()
var look_direction = Vector2.DOWN
var attack_dir = look_direction
var animation_lock = 0.0
var damage_lock = 0.0
var charge_time = 2.5
var charge_start = 0.0

var slash_scene = preload("res://entities/Attacks/slash.tscn")

@onready var p_HUD = get_tree().get_first_node_in_group("HUD")

func get_direction_name():
	return ["right", "down", "left", "up"][
		int(round(look_direction.angle() * 2 / PI))%4
	]

func attack():
	data.state = STATES.ATTACKING
	var dire = get_direction_name()
	if dire == "left" :
		$AnimatedSprite2D.flip_h = 0
	$AnimatedSprite2D.play("swipe_" + dire)
	attack_dir = look_direction
	var slash = slash_scene.instantiate()
	slash.position = attack_dir * 20.0
	slash.rotation = Vector2().angle_to_point(-attack_dir)
	add_child(slash)
	animation_lock = 0.2

func _ready() -> void:
	p_HUD.show()

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func pickup_money(value):
	data.money += value
	data.money = clamp(data.money, 0, data.max_money)
	p_HUD.add_money(value)


func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock-delta, 0.0)
	
	if animation_lock == 0 and data.state != STATES.DEAD:
		if data.state != STATES.CHARGING:
			data.state = STATES.IDLE
		
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
		
	
	if data.state != STATES.DEAD:
		if Input.is_action_just_pressed("ui_accept"):
			attack()
			# TODO: charge time/state
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true
	pass

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
