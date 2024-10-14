extends RigidBody2D

@export var speed = 10

var dir : float
var spawnPos : Vector2
var spawnRot : float
func _ready() -> void:
	dir = 1
	self.global_rotation = spawnRot
	if Input.get_axis("ui_left", "ui_right") != 0:
		dir = Input.get_axis("ui_left", "ui_right")
	print(dir)
	if dir == 1:
		set_spawn(self.position + Vector2(15, 10))
	else:
		set_spawn(self.position + Vector2(-15, 10))

func _physics_process(delta: float) -> void:
	self.linear_velocity.x = speed * dir
	if position.x < spawnPos.x-100 || position.x > spawnPos.x+100:
		queue_free()
		print("check")
	var velocity = Vector2(speed * dir, 0)
	var col = move_and_collide(velocity)

func _on_body_entered(body: Node) -> void:
	if body.name == "plt_enemy":
		body.queue_free();

func set_spawn(pos : Vector2) :
	spawnPos = pos
