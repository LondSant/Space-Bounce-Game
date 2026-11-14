extends AnimatedSprite2D

var posicion_anterior: float

func _ready() -> void:
	posicion_anterior = global_position.x


func _process(_delta: float) -> void:
	if global_position.x < posicion_anterior:
		flip_h = true       
	elif global_position.x > posicion_anterior:
		flip_h = false     
	posicion_anterior = global_position.x
