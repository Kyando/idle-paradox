class_name Player
extends CharacterBody2D

var player_direction : Vector2
var is_recording: bool = true
var is_autoplaying: bool = false
var current_index: int = 0
var recording_values =  {
	"position":[],
	"velocity":[],
}

func _process(delta: float) -> void:
	if Input.is_action_just_released("perform_action"):
		is_autoplaying = true
		is_recording = false
		#if is_recording:
			#is_recording = false
			#is_autoplaying = true
		#else:
			#if is_autoplaying:
				#is_autoplaying = false
				#
			#else:
				#current_index = 0
				#recording_values = {
					#"position":[],
					#"velocity":[],
					#}
		#print("autoplayng: " + str(is_autoplaying) + " | recording: " + str(is_recording))


func _physics_process(delta: float) -> void:

	if is_recording:
		recording_values['position'].append(global_position)
		recording_values['velocity'].append(velocity)
		print("recorded")
	
	if is_autoplaying:
		compute_autoplay()
		
func compute_autoplay() -> void:
	var pos = recording_values['position'][current_index]
	global_position = pos
	
	current_index += 1
	if current_index >= len(recording_values['position']):
		current_index = 0
	
	
	
	
	
