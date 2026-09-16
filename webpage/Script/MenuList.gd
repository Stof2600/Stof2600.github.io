extends Node
class_name MenuList

@export var Menus: Array[Control]
@export var pageSelect: Control

var lastActive: Control

func _ready() -> void:
	lastActive = Menus[0]
	
	pageSelect.visible = false
	
	for m in Menus:
		m.visible = false

func LoadMenu(search: String):
	lastActive.visible = false
	
	for m in Menus:
		if m.name.to_lower() == search.to_lower():
			m.visible = true
			lastActive = m
			return m
	
	Menus[0].visible = true
	lastActive = Menus[0]
	print("NO MENU FOUND, CHECK MENU LIST OR GRAMMAR")
	return Menus[0]

func SetPageSelect(open: bool = true):
	pageSelect.visible = open
	pass
