extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	if direction == Vector2.LEFT:
		animated_sprite.flip_h = true
	elif direction == Vector2.RIGHT:
		animated_sprite.flip_h = false
		
	animated_sprite.play("walking")
	
	player.velocity = direction * speed
	
	player.move_and_slide()

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if !GameInputEvents.is_movement_input():
		transition.emit("IdleState")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
