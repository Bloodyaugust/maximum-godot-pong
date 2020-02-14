extends Node2D

var BALL_SIZE: float = 16
var MAX_ENGLISH: float = 5
var PLAYER_HEIGHT: float = 96
var SCREEN_HEIGHT: float = 600
var SCREEN_WIDTH: float = 1024
var SPEED: float = SCREEN_WIDTH / 2
var SPEED_INCREMENT: float = SPEED / 10

onready var _area2d: Area2D = $"Area2D"

var _current_speed: float
var _velocity: Vector2

func _add_english(paddle_area: Area2D):
  var _distance_scalar = clamp(position.distance_to(paddle_area.global_position) / PLAYER_HEIGHT, 0, 1)
  var _english_amount = lerp(0, MAX_ENGLISH, _distance_scalar)

  if paddle_area.global_position.y >= position.y:
    _velocity.y -= _english_amount
  else:
    _velocity.y += _english_amount

  _velocity = _velocity.normalized()

func _add_speed():
  _current_speed += SPEED_INCREMENT

func _on_area2d_entered(area2d):
  _velocity.x *= -1

  _add_speed()
  _add_english(area2d)

func _ready():
  _area2d.connect("area_entered", self, "_on_area2d_entered")

  _reset()

func _reset():
  _current_speed = SPEED
  _velocity = Vector2(rand_range(-1, -1.2), rand_range(-1, 1)).normalized()

  position = Vector2(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

func _physics_process(delta):
  position += _velocity * delta * _current_speed

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
