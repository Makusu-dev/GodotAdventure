extends CharacterBody2D
class_name Player

@export var move_speed: float = 150
@export var push_force: float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = SceneManager.player_spawn_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var move_vector: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = move_speed*move_vector
	
	if velocity.x>0:
		$AnimatedSprite2D.play("walk_right")
	elif velocity.x<0:
		$AnimatedSprite2D.play("walk_left")
	elif velocity.y<0:
		$AnimatedSprite2D.play("walk_up")
	elif velocity.y>0:
		$AnimatedSprite2D.play("walk_down")
	else:
		$AnimatedSprite2D.stop()
		
		
	# get the last collision
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision:
		var collider_node = collision.get_collider()
		print(collider_node)
	#check if it is the block
		if collider_node is RigidBody2D:
			var collision_normal: Vector2 = collision.get_normal()
			collider_node.apply_central_force(-collision_normal*push_force)
	#then push
		
	move_and_slide()
