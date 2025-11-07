extends Area2D

var bodies_on_top: int
signal pressed
signal unpressed

func _on_body_entered(body: Node2D) -> void:
		bodies_on_top+=1
		if body.is_in_group("pushable") or body is Player:
			if bodies_on_top==1:
				pressed.emit()
				print("I have been pushed") 
				$AnimatedSprite2D.play("pressed")
		


func _on_body_exited(body: Node2D) -> void:
	bodies_on_top-=1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top==0:
			unpressed.emit()
			print("I have been unpushed")
			$AnimatedSprite2D.play("unpressed")# Replace with function body.
