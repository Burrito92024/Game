extends Node2D

@export var health := 3

func _ready():
	health == 3
	$"../Label".text = str(health) + "hp"
	
func _on_body_entered(_body: Node2D):
	health -=1
	$"../Label".text = str(health) + "hp"
	if health <= 0:
		get_tree().quit()
