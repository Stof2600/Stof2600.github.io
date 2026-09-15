extends Area3D

@onready var text: Label3D = $OptionText
@export var labetText: String = "BUTTON"
@export var defaultColor: Color
@export var hoverColor: Color
@export var clickColor: Color

##Which menu to open when pressed, leave blank for no menu change
@export var menuTarget: String

signal ButtonPressed()
signal ButtonChangeMenu(menuName: String)

var pressLength: float = 0.1
var pressTimer: float = 0
var mouseHover: bool = false

func _ready() -> void:
	text.text = labetText

func _process(delta: float) -> void:
	if pressTimer > 0:
		text.modulate = clickColor
		pressTimer -= delta
		return
	
	text.modulate = defaultColor if !mouseHover else hoverColor
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && mouseHover && pressTimer <= 0:
		ButtonPressed.emit()
		if(menuTarget.length() > 0):
			ButtonChangeMenu.emit(menuTarget)
		pressTimer = pressLength
	
	pass

func MouseEnter():
	mouseHover = true
func MouseExit():
	mouseHover = false
