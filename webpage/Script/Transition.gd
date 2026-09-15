extends Node3D

@onready var startScreen: Node3D = $"../Startup"
@onready var arrows: = [$TransitionArrow1, $TransitionArrow2, $TransitionArrow3, $TransitionArrow4, $TransitionArrow5]
@onready var menuList: MenuList = $"../MenuList"
@export var bootTimer: float = 1
@export var transitionTimer: float = 2

@export var arrowStartPos: float = -2.5
@export var arrowCutPos: float = 0
@export var arrowEndPos: float = 2.5
@export var arrowOffset: float = 0.5

var tt: float = 0

var doIntro: bool = true
var doTransition: bool = false
var transitionUp: bool = true

signal TransitionCut

func _ready() -> void:
	doIntro = true
	startScreen.visible = true
	
	ResetTransition()
	RequestTransition()
	
	pass

func _process(delta: float) -> void:
	if doTransition:
		Transition(delta)
	
	if Input.is_key_pressed(KEY_SPACE):
		RequestTransition()
	
	pass

func Transition(delta: float) -> void:
	#show the logo
	if bootTimer > 0 && doIntro:
		startScreen.visible = true
		bootTimer -= delta
		return
	
	#move arrows for transition
	for i in arrows.size():
		var a = arrows[i]
		a.visible = true
		
		if a.position.x < 0 && transitionUp:
			var start = arrowStartPos - (arrowOffset * i)
			var end = arrowEndPos + (arrowOffset * (arrows.size() - 1))
			a.position.x = lerp(start, end, tt / transitionTimer)
		elif a.position.x < arrowEndPos && !transitionUp:
			var end = arrowEndPos + (arrowOffset * (arrows.size() - i))
			a.position.x = lerp(end, arrowCutPos, tt / transitionTimer)
			pass
	
	#update timer for transition
	if tt > transitionTimer && transitionUp:
		TransitionCut.emit()
		startScreen.visible = false
		transitionUp = false
		
		if(doIntro):
			menuList.LoadMenu("MainMenu")
			doIntro = false
		
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
	
	for a in arrows:
		a.visible = false
		a.position.x = arrowStartPos
	
	pass

func RequestTransition():
	if doTransition: return
	doTransition = true
