extends Node2D

var BALL_SIZE: float = 16
var SCREEN_HEIGHT: float = 600
var SCREEN_WIDTH: float = 1024
var SPEED: float = SCREEN_WIDTH / 2

onready var _area2d: Area2D = $"Area2D"
onready var _velocity: Vector2 = Vector2(rand_range(-1, -3), rand_range(-1, 1))

func _on_area2d_entered(area2d):
  _velocity.x *= -1

func _ready():
  _area2d.connect("area_entered", self, "_on_area2d_entered")

func _reset():
  _velocity = Vector2(rand_range(-1, -3), rand_range(-1, 1))
  position = Vector2(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

func _physics_process(delta):
  position += _velocity * delta * SPEED

func _process(delta):
  if position.x > SCREEN_WIDTH - (BALL_SIZE / 2):
    _reset()

  if position.x < BALL_SIZE / 2:
    _reset()

  if position.y > SCREEN_HEIGHT - (BALL_SIZE / 2):
    position.y = SCREEN_HEIGHT - (BALL_SIZE / 2)
    _velocity.y *= -1
    
  if position.y < BALL_SIZE / 2:
    position.y = BALL_SIZE / 2
    _velocity.y *= -1
