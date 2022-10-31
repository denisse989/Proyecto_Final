extends KinematicBody2D


var velocity=Vector2.ZERO
var jump=Vector2.UP * 600
var gravity=Vector2.DOWN * 2000
var down=Vector2.DOWN * 6000
var start=false
var rotation_speed = 1.5

func _process(delta):
	if  is_on_floor() and Input.is_action_just_pressed("saltar"):
		
		velocity = jump
		#rotation += 5 *rotation_speed* delta
	else:
		
		velocity += gravity * delta
		#rotation = stepify (rotation, PI / 2.0)
			
	move_and_slide(velocity,Vector2.UP)


	
