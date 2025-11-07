extends StaticBody2D

var buttons_pressed: int = 0


func _on_puzzle_button_pressed() -> void:
	buttons_pressed+=1
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)

func _on_puzzle_button_unpressed() -> void:
	buttons_pressed-=1
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
