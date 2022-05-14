extends KinematicBody

var gravity_s:= 9.8
var speed_s:= 3.0
var velocity:= Vector3.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	var input_direction:= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
#	print(input_direction)
	
	velocity = Vector3(input_direction.x, 0, input_direction.y)* speed_s
	velocity.y = -gravity_s
	velocity = move_and_slide(velocity, Vector3.UP)
