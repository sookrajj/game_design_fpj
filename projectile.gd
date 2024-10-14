extends Area2D

@export var speed = 10

var dir : float
var spawnPos : Vector2
var spawnRot : float
func _ready() -> void:
	dir = 1
	self.global_rotation = spawnRot
	if Input.get_axis("ui_left", "ui_right") != 0:
		dir = Input.get_axis("ui_left", "ui_right")
	if dir == 1:
		set_spawn(self.position + Vector2(15, 100))
	else:
		set_spawn(self.position + Vector2(-15, 100))

func _physics_process(delta: float) -> void:
	self.move_local_x(speed*dir)
	if position.x < spawnPos.x-100 || position.x > spawnPos.x+100:
		queue_free()
		print("check")
	var velocity = Vector2(speed * dir, 0)
	

func _on_body_entered(body: Node) -> void:
	print("new")
	if body.is_in_group("enemies"):
		body.queue_free();
		print("hi")

func set_spawn(pos : Vector2) :
	spawnPos = pos
