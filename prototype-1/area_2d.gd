extends Area2D

func _on_area_entered(_body: Node2D):
	get_parent().health -=1
	print("no")
	
	if get_parent().health <= 0:
		get_tree().quit()
