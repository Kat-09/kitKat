extends CharacterBody2D

var enteredTimes = 0
var isMushroom = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = -400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
