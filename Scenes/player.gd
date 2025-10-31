extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score: int = 200;
	var username: String = "bob"
	var firstName: String = "max"
	var damage : float = 7.5
	var is_player_alive: bool = true
	var speed = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
