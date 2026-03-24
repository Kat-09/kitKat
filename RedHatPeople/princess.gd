extends Sprite2D

var nextone = preload("res://Scenes/RedHatPeople/Fella.tscn")
var shouldproduce = false
#var mushroom = preload("res://Scenes/RedHatPeople/Mushroom.tscn")
#false means that it's an evilfella, true means it's a mushroom
var lastproduced = false
var isMushroom = false
var canStart = false
var initFinished = false

func _process(float) -> void:
	
	if !$"../AnimationPlayer".is_playing() and initFinished == false:
		canStart = true
		initFinished = true

	if canStart == true:
		$"../Downloading".playing = true
		shouldproduce = true
		$Timer.start()
		$Timer2.start()
		canStart = false
	
	if lastproduced == false and shouldproduce == true:
		var instance = nextone.instantiate()
		add_child(instance)
		shouldproduce = false
		isMushroom = false
		$CharacterBody2D.isMushroom = false

	if lastproduced == true and shouldproduce == true:
		var instance = nextone.instantiate()
		add_child(instance)
		#This changes the texture of evilfella to a mushroom
		var mushroom = load("res://Assets/Menu/Mushroom/Mushroom.png")
		$CharacterBody2D/Fella.texture = mushroom
		$CharacterBody2D.isMushroom = true
		isMushroom = true
		shouldproduce = false

func _on_timer_timeout() -> void:
	if isMushroom == false:
		$CharacterBody2D.queue_free()
		shouldMakeNew()
	if isMushroom == true:
		shouldMakeNew()

func _on_hat_man_area_2d_area_entered(area: Area2D) -> void:
	if isMushroom == true:
		$CharacterBody2D.queue_free()

func shouldMakeNew():
	lastproduced = !lastproduced
	shouldproduce = true

func _on_timer_2_timeout() -> void:
	if isMushroom == false:
		$CharacterBody2D/Fella.flip_h = !$CharacterBody2D/Fella.flip_h
