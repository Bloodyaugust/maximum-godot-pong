extends Node2D

var _ball: Object

func _ready():
  _ball = $"../Ball"

func _physics_process(delta):
  position.y = _ball.position.y
