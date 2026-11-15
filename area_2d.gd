extends Area2D

@export_file("*.tscn") var escena_destino: String

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("morir"):
		get_tree().change_scene_to_file.call_deferred(escena_destino)
