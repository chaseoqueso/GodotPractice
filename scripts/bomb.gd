extends Area2D

func _ready():
    $AnimatedSprite2D.play("moving")

func _on_timer_timeout() -> void:
    if is_instance_valid(self):
        self.queue_free()

func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        $AnimatedSprite2D.play("explode")
        $Timer.start()
