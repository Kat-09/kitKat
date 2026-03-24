extends Sprite2D

var nextone = preload("res://Scenes/RedHatPeople/Fella.tscn")
var shouldproduce = true
#var mushroom = preload("res://Scenes/RedHatPeople/Mushroom.tscn")
#false means that it's an evilfella, true means it's a mushroom
var lastproduced = false

func _process(float) -> void:

	if lastproduced == false and shouldproduce == true:
		var instance = nextone.instantiate()
		add_child(instance)
		shouldproduce = false

	if lastproduced == true and shouldproduce == true:
		var instance = nextone.instantiate()
		add_child(instance)
		#This changes the texture of evilfella to a mushroom
		var mushroom = load("res://Assets/Menu/Mushroom/Mushroom.png")
		$CharacterBody2D/Fella.texture = mushroom
		$CharacterBody2D.isMushroom = true
		shouldproduce = false
		

func _on_remover_area_entered(area: Area2D) -> void:
	lastproduced = !lastproduced



func _on_hat_man_area_2d_area_entered(area: Area2D) -> void:
	if $CharacterBody2D.isMushroom == true:
		lastproduced = !lastproduced
		shouldproduce = true
