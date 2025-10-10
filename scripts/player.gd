extends CharacterBody2D

@export var maxSpeed: float = 100
@export var accel: float = 500
@export var gravity: float = 200

func _physics_process(delta: float) -> void:
    var inputX: float = Input.get_action_strength("right") - Input.get_action_strength("left")
    velocity.x += inputX * accel * delta
    if abs(velocity.x) > maxSpeed:
        velocity.x = sign(velocity.x) * maxSpeed
    velocity.y += gravity * delta
    move_and_slide()