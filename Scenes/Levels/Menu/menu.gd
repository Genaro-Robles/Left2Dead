extends Control
@export_file('*.tscn') var new_scene

	
func _on_button_pressed():
	get_tree().change_scene_to_file(new_scene)
	pass

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1/level_1.tscn")
	pass # Replace with function body.



func _on_salir_pressed():
	get_tree().quit()
	pass # Replace with function body.



