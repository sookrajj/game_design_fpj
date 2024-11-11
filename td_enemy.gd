extends CharacterBody2D

const SPEED = 60.0
var max_health = 30.0
var health = max_health
var damage = 10.0
var AI_STATE = STATES.IDLE
enum STATES {
	IDLE = 0, UP, DOWN, LEFT, RIGHT, UP_L, UP_R, DOWN_L, DOWN_R, DAMAGED
}
var statedirs = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(),
	Vector2(1, -1).normalized(),
	Vector2(-1, 1).normalized(),
	Vector2(1, 1).normalized(),
	Vector2.ZERO
]

var state_anims = [
	"",
	"walk_up",
	"walk_down",
	"walk_left",
	"walk_right",
	"walk_left",
	"walk_right",
	"walk_left",
	"walk_right",
	""
]


var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var animation_lock = 0.0
var damage_lock = 0.0
var knockback = 128.0
var vision_distance = 50.0
var money_value = 5.0

signal recovered

@onready var rcR = $topray
@onready var rcM = $midray
@onready var rcL = $bottomray
@onready var anim_player = $AnimatedSprite2D

func turn_toward_player(location: Vector2):
	pass


func take_damage(dmg, attacker = null):
	if damage_lock == 0.0:
		#AI_STATE = STATES.DAMAGED
		health -= dmg
		damage_lock = 0.2
		animation_lock = 0.2
		#TODO damage shader
		if health <= 0:
			#TODO drop item
			#TODO sound
			queue_free()
		else:
			if attacker != null:
				await recovered
				turn_toward_player(attacker.global_position)
	pass


func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock - delta, 0.0)
	if int(AI_STATE) >= 1 and int(AI_STATE) <= 8:
		var raydir = statedirs[int(AI_STATE)]
		rcM.target_position = raydir * vision_distance
		rcL.target_position = raydir.rotated(deg_to_rad(-45)).normalized() * vision_distance
		rcR.target_position = raydir.rotated(deg_to_rad(45)).normalized() * vision_distance
	if animation_lock == 0.0:
		#TODO recover from damage
		#TODO damage player
		
		ai_timer = clamp(ai_timer - delta, 0.0, ai_timer_max)
		if ai_timer == 0.0:
			if AI_STATE == STATES.IDLE:
				var ran = randi() %4
				AI_STATE = STATES.values()[ran+1]
			else:
				AI_STATE = STATES.IDLE
			ai_timer = ai_timer_max
			
		var direction = statedirs[int(AI_STATE)]
		velocity = direction * SPEED
		var animation = state_anims[int(AI_STATE)]
		if animation and not anim_player.is_playing():
			anim_player.play(animation)
		if AI_STATE == STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		
		velocity += inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000.0)
	
	
	

	pass
