extends CharacterBody2D

var direction := Vector2(1,1)
var speed: int = 120
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_player_left","move_player_right", "move_player_up", "move_player_down")
	velocity = direction * speed
	animation()
	move_and_slide()
func animation():
	if direction:
		sprite.flip_h = direction.x > 0
		if direction.x != 0:
			sprite.animation = "left_walking"
		else:
			if direction.y < 0:
				sprite.animation = "up_walking"
			if direction.y > 0:
				sprite.animation = "down_walking"
	else:
		sprite.frame = 0
