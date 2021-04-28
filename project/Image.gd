extends Node2D

func _ready():
	generate_image(Vector2(32, 32), Color.white, "white.png")
	generate_image(Vector2(128, 128), Color(0, 0, 0, 0), "bg.png")
	
	var hue = 0.0
	var hue_step = 1.0 / $BG/Sprites.get_child_count()
	
	# Combine images filled with a color
	var img = $BG.texture.get_data()
	for sp in $BG/Sprites.get_children():
		var sprite : Sprite = sp
		var sqr = sprite.texture.get_data()
		var mod = Color.from_hsv(hue, 0.5, 1.0)
		sprite.modulate = mod
		sqr.fill(mod)
		img.blend_rect(sqr, Rect2(Vector2.ZERO, sqr.get_size()), sp.position)
		hue += hue_step
	img.save_png("composite1.png")
	
	# Overlapped images
	img = $BG2.texture.get_data()
	for sp in $BG2/Sprites.get_children():
		var sprite : Sprite = sp
		var sqr = sprite.texture.get_data()
		var mod = Color.from_hsv(hue, 0.5, 1.0, 0.5)
		sprite.modulate = mod
		sqr.fill(mod)
		img.blend_rect(sqr, Rect2(Vector2.ZERO, sqr.get_size()), sp.position)
		hue += hue_step
	img.save_png("composite2.png")


func generate_image(size: Vector2, color: Color, fn: String):
	var img = Image.new()
	img.create(size.x, size.y, false, Image.FORMAT_RGBA8)
	img.fill(color)
	img.save_png(fn)
	
