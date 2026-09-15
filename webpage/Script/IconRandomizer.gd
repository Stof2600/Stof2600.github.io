extends Sprite3D

#random chance done by just inserting the regular one a lot
#also known as terrible code
@onready var iconSprites: = [
	"res://Logos/DragonBlue.png", "res://Logos/DragonBlue.png", 
	"res://Logos/DragonBlue.png", "res://Logos/DragonBlue.png", 
	"res://Logos/DragonBlue.png", "res://Logos/DragonRed.png",
	 "res://Logos/DragonBlack.png", "res://Logos/DaSnake.png"]

func _ready() -> void:
	
	texture = load(iconSprites[randi_range(0, iconSprites.size() - 1)])
	
	pass
