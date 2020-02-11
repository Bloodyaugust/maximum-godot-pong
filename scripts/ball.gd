extends Node2D

var BALL_SIZE: float = 16
var SCREEN_HEIGHT: float = 600
var SCREEN_WIDTH: float = 1024

onready var _velocity: Vector2 = Vector2(rand_range(-1, -3), rand_range(-1, 1))

func _physics_process(delta):
  position += _velocity * delta

func _process(delta):
  if position.x > SCREEN_WIDTH - (BALL_SIZE / 2):
    position.x = SCREEN_WIDTH - (BALL_SIZE / 2)

  if position.x < BALL_SIZE / 2:
    position.x = BALL_SIZE / 2

  if position.y > SCREEN_HEIGHT - (BALL_SIZE / 2):
    position.y = SCREEN_HEIGHT - (BALL_SIZE / 2)
    
  if position.y < BALL_SIZE / 2:
    position.y = BALL_SIZE / 2
