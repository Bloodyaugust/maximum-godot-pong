extends Node2D

var MOVE_SPEED: float = 450
var PLAYER_HEIGHT: float = 96
var SCREEN_HEIGHT: float = 600

func _physics_process(delta):
  var _down = Input.get_action_strength("ui_down")
  var _up = -Input.get_action_strength("ui_up")
  
  position += Vector2(0, _down + _up) * MOVE_SPEED * delta
  position.y = clamp(position.y, PLAYER_HEIGHT / 2, SCREEN_HEIGHT - (PLAYER_HEIGHT / 2))
