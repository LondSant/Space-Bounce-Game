extends CharacterBody2D
@onready var animacion: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -750.0

var posicion_inicial: Vector2   # <-- NUEVO


func _ready() -> void:          # <-- NUEVO
	posicion_inicial = global_position


func morir() -> void:           # <-- NUEVO
	global_position = posicion_inicial
	velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		animacion.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animaciones
	if not is_on_floor():
		animacion.play("jump")
	elif direction:
		animacion.play("run")
	else:
		animacion.play("default")

	move_and_slide()
