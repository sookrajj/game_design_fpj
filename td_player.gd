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
var damage_shader = preload("res://assests/shaders/take_damage.tres")
var attack_sound = preload("res://assests/sounds/slash.wav")
var coin_sound = preload("res://assests/sounds/pcoin.wav")
var heart_sound = preload("res://assests/sounds/pheart.wav")
var death_sound = preload("res://assests/sounds/pdeath.wav")
var hurt_sound = preload("res://assests/sounds/phurt.wav")
var hit_sound = preload("res://assests/sounds/phit.wav")

@onready var p_HUD = get_tree().get_first_node_in_group("HUD")
@onready var aud = $AudioStreamPlayer2D

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
	aud.stream = attack_sound
	aud.play()
	animation_lock = 0.2

func charged_attack():
	data.state = STATES.ATTACKING
	$AnimatedSprite2D.play("swipe_charge")
	attack_dir = -look_direction
	damage_lock = 0.3
	for i in range(9):
		var angle = attack_dir.angle() + (i-4) * PI/4
		var dir = Vector2(cos(angle), sin(angle))
		var ns = slash_scene.instantiate()
		ns.position = dir * 20
		ns.rotation = Vector2().angle_to_point(-dir)
		ns.damage *= 1.5
		add_child(ns)
		aud.stream = hit_sound
		aud.play()
		await get_tree().create_timer(0.03).timeout
	animation_lock = 0.2
	await $AnimatedSprite2D.animation_finished
	data.state = STATES.IDLE

signal health_depleted

func take_damage(damage):
	if damage_lock == 0.0:
		data.health -= damage
		data.state = STATES.DAMAGED
		damage_lock = 0.5
		animation_lock = damage * 0.005
		$AnimatedSprite2D.material = damage_shader.duplicate()
		$AnimatedSprite2D.material.set_shader_parameter("intensity", 0.5)
		if data.health > 0:
			aud.stream = hurt_sound
			aud.play()
			pass
		else:
			data.state = STATES.DEAD
			aud.stream = death_sound
			aud.play()
			await get_tree().create_timer(0.5).timeout
			health_depleted.emit()
	
	pass


func _ready() -> void:
	p_HUD.show()

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)
	aud.stream = heart_sound
	aud.play()

func pickup_money(value):
	data.money += value
	data.money = clamp(data.money, 0, data.max_money)
	aud.stream = coin_sound
	aud.play()
	p_HUD.add_money(value)

func pickup_container():
	data.max_health = clamp(data.max_health + 20.0, 0, MAX_OBTAINABLE_HEALTH)
	data.health += data.max_health
	data.health = clamp(data.health, 0, data.max_health)
	p_HUD.draw_hearts()

func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock-delta, 0.0)
	
	if animation_lock == 0 and data.state != STATES.DEAD:
		if data.state != STATES.DAMAGED and max(damage_lock-delta, 0.0):
			$AnimatedSprite2D.material = null;
		
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
			charge_start = 0.0
			data.state = STATES.CHARGING
		
		charge_start += delta
		if (charge_start >= charge_time):
			aud.stream = coin_sound
			aud.play()
		if Input.is_action_just_released("ui_accept"):
			if charge_start >= charge_time and data.state == STATES.CHARGING:
				charged_attack()
			else:
				data.state = STATES.IDLE
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true
	pass

func update_animation(direction):
	if data.state == STATES.IDLE:
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
