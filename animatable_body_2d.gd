extends Area2D

@export_file("*.tscn") var escena_destino: String

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("morir"):
		get_tree().change_scene_to_file.call_deferred(escena_destino)


func _on_mouse_shape_entered(shape_idx: int) -> void:
	pass # Replace with function body.
