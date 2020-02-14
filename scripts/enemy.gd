extends Node2D

var MOVE_SPEED: float = 450
var PLAYER_HEIGHT: float = 96
var SCREEN_HEIGHT: float = 600

var _ball: Object

func _ready():
  _ball = $"../Ball"

func _physics_process(delta):
  position.y = _ball.position.y
  position.y = clamp(position.y, PLAYER_HEIGHT / 2, SCREEN_HEIGHT - (PLAYER_HEIGHT / 2))
