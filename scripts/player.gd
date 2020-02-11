extends Node2D

var MOVE_SPEED: float = 450
var SCREEN_HEIGHT: float = 600

func _physics_process(delta):
  var _down = Input.get_action_strength("ui_down")
  var _up = -Input.get_action_strength("ui_up")
  
  position += Vector2(0, _down + _up) * MOVE_SPEED * delta
  position.y = clamp(position.y, 0, SCREEN_HEIGHT)
