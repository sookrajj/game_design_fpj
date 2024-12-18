extends RigidBody2D

var velocity = Vector2()

func _ready() -> void:
	velocity.x = -200

func _physics_process(delta: float) -> void:
	if position.x < -1000:
		queue_free()
	move_and_collide(velocity)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("enemies"):
		body.queue_free();
