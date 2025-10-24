extends CharacterBody2D

@export var maxSpeed: float = 100
@export var accel: float = 500
@export var gravity: float = 200
@export var jumpVelocity: float = 100

var is_attacking = false
var is_climbing = false

func _process(delta: float) -> void:
    var inputX: float = Input.get_action_strength("right") - Input.get_action_strength("left")
    # if !Input.is_action_just_released("jump"):
    if !is_attacking:
        if inputX < 0:
            $AnimatedSprite2D.flip_h = true
            $AnimatedSprite2D.play("run")
        elif inputX > 0:
            $AnimatedSprite2D.flip_h = false
            $AnimatedSprite2D.play("run")
        else:
            $AnimatedSprite2D.play("idle")

func _physics_process(delta: float) -> void:
    var inputX: float = Input.get_action_strength("right") - Input.get_action_strength("left")
    velocity.x += inputX * accel * delta
    if abs(velocity.x) > maxSpeed:
        velocity.x = sign(velocity.x) * maxSpeed
    velocity.y += gravity * delta
    move_and_slide()

func _input(event):
    #on attack
    if event.is_action_pressed("attack"):
        is_attacking = true
        $AnimatedSprite2D.play("attack")

    if event.is_action_pressed("jump") and is_on_floor():
        velocity.y = -jumpVelocity
        $AnimatedSprite2D.play("jump")

func _on_animated_sprite_2d_animation_finished() -> void:
    is_attacking = false
