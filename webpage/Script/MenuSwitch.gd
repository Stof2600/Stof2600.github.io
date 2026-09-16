extends Button
@export var menuTarget: String
@export var buttonText: String = "BUTTON"

#handle text color manually to deal with weird fonts
@export var normalColor: Color = Color.BLACK
@export var hoverColor: Color = Color.GRAY
@export var clickColor: Color = Color.GREEN

@onready var displayText: Label = $Text

var clickTimer: float = 0
var clickLenght: float = 0.1

signal ButtonPressed()
signal ButtonChangeMenu(menuName: String)

func _ready() -> void:
	if !displayText: return
	displayText.text = buttonText
	displayText.modulate = normalColor
func _process(delta: float) -> void:
	if clickTimer <= 0: return
	
	clickTimer -= delta
	displayText.modulate = clickColor
	if clickTimer <= 0: displayText.modulate = normalColor

func _pressed() -> void:
	if clickTimer > 0: return
	
	ButtonPressed.emit()
	ButtonChangeMenu.emit(menuTarget)
	clickTimer = clickLenght

func MouseEnter():
	if !displayText: return
	displayText.modulate = hoverColor
	pass
func MouseExit():
	if !displayText: return
	displayText.modulate = normalColor
	pass
