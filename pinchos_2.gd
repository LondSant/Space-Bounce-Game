extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Toqué algo: ", body.name)
	if body.has_method("morir"):
		body.morir()
