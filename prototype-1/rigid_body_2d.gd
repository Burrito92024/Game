extends RigidBody2D

var health = 1

func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
