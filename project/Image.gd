extends Node2D

func _ready():
	# Assign colors
	var num_sprites = $Sprites.get_child_count()
	var hue_step = 1.0 / num_sprites
	var hue = 0.0
	for s in $Sprites.get_children():
		var sprite : Sprite = s
		sprite.modulate = Color.from_hsv(hue, 0.5, 1.0)
		hue += hue_step
