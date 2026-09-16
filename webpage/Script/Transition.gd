extends Control
class_name Transition

@onready var startScreen: Control = $"../Startup"
@onready var arrowBlock: TextureRect = $ArrowBlock
@onready var menuList: MenuList = $"../../../MenuList"
@export var bootTimer: float = 0.5
##is double of what you input due to quickly written code
@export var transitionTimer: float = 1

@export var arrowStartPos: float = -2800
@export var arrowCutPos: float = -800
@export var arrowEndPos: float = 1280

var tt: float = 0

var doIntro: bool = true
var doTransition: bool = false
var transitionUp: bool = true

var menuToLoad: String = "MainMenu"

signal TransitionCut

func _ready() -> void:
	doIntro = true
	startScreen.visible = true
	
	ResetTransition()
	RequestTransition("MainMenu")
	
	pass

func _process(delta: float) -> void:
	if doTransition:
		Transition(delta)
	
	pass

func Transition(delta: float) -> void:
	#show the logo
	if bootTimer > 0 && doIntro:
		startScreen.visible = true
		bootTimer -= delta
		return
	
	#move arrows for transition
	if transitionUp:
		arrowBlock.position.x = lerp(arrowStartPos, arrowCutPos, tt / transitionTimer)
	elif !transitionUp:
		arrowBlock.position.x = lerp(arrowEndPos, arrowCutPos, tt / transitionTimer)
	
	#update timer for transition
	if tt > transitionTimer && transitionUp:
		TransitionCut.emit()
		startScreen.visible = false
		transitionUp = false
		
		if(doIntro):
			menuList.LoadMenu("MainMenu")
			menuList.SetPageSelect(true)
			doIntro = false
		else:
			menuList.LoadMenu(menuToLoad)
			menuList.SetPageSelect(true)
		
		pass
	elif transitionUp:
		tt += delta
	
	if tt <= 0 && !transitionUp:
		transitionUp = true
		ResetTransition()
	elif !transitionUp:
		tt -= delta
	
	pass

func ResetTransition() -> void:
	transitionUp = true
	doTransition = false
	
	arrowBlock.visible = false
	arrowBlock.position.x = arrowStartPos
	
	pass

func RequestTransition(menuName: String):
	if doTransition || (menuList.lastActive.name.to_lower() == menuName.to_lower() && !doIntro): return
	doTransition = true
	menuToLoad = menuName
	arrowBlock.visible = true
