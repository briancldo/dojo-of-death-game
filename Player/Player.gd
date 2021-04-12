extends KinematicBody2D

var velocity = 350

func _ready():
	pass

func _process(delta):
	handle_movement(delta)
	
func handle_movement(delta):
	handle_run(delta)

func handle_run(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var vector_to_mouse = mouse_position - position
	
	print(vector_to_mouse.x)
	if abs(vector_to_mouse.x) < velocity * delta:
		vector_to_mouse.x = 0
	if abs(vector_to_mouse.y) < velocity * delta:
		vector_to_mouse.y = 0
	
	var movement = velocity * delta * vector_to_mouse.normalized()
	print(movement)
	move_and_collide(movement)
