extends RigidBody2D

var speed = 400
var dir = -1

func start(direction):
	dir = direction
	_physics_process(1)

func _physics_process(delta: float) -> void:
	self.linear_velocity.x = speed * dir

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("enemies"):
		body.queue_free();
