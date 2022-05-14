extends KinematicBody

onready var Navigation_:= get_node("../Navigation")
onready var Player:= get_node("../Player")

var gravity_s:= 9.8
var speed_s:= 2.5
var path:= []
var path_index:= 0
var velocity:= Vector3.ZERO

func _ready() -> void:
	update_path()

func _physics_process(delta: float) -> void:
	if path_index < path.size():
		var direction = path[path_index] - global_transform.origin
		if direction.length() < 0.2:
			path_index += 1
		else:
			velocity = direction.normalized() * speed_s
	
	velocity.y = -gravity_s
	velocity = move_and_slide(velocity, Vector3.UP)


func update_path():
	var start = global_transform.origin
	var end = Player.global_transform.origin
	
	path = Navigation_.get_simple_path(start, end)
	path_index = 0


func _on_Timer_timeout() -> void:
	update_path()
