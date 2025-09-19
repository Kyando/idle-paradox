extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D

var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	
	direction = GameInputEvents.movement_input()
	animated_sprite.play("idle")
	
	#if Input.is_action_pressed("perform_action"):
		#direction = Vector2.ZERO
		#animated_sprite.play("action")
	#elif direction != Vector2.ZERO:
		#animated_sprite.play("walking")
	#else:
		#animated_sprite.play("idle")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("WalkState")
	


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
