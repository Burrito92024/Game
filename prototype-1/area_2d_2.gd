extends Area2D

func _input(event):
	if event.is_action_pressed("Click"):
		for area in get_overlapping_bodies():
			area.health -=1
			area.is_in_group("enemy")
	
