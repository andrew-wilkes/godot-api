extends Control

func _ready():
	# Change scene or provide a menu of available scenes
	print(get_tree().change_scene("res://Image.tscn"))
