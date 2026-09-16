extends Control

@onready var gameIcon: TextureRect = $GameIcon
@onready var Title: Label = $GameName
@onready var descr: Label = $Description

@export var  gameName: String = "ADAURUM"

var domainURL: String = "https://stof2600.github.io/"
var iconURL: String
var gameURL: String
var descURL: String

func _ready() -> void:
	Title.text = gameName.to_upper()
	
	var baseURL: String = domainURL + "HTMLGames/" + gameName.to_upper() + "/"
	iconURL = baseURL + "icon.png"
	gameURL = baseURL + gameName
	descURL = baseURL + "descr.txt"
	
	DownloadIcon()
	DownloadDesc()

func DownloadIcon():
	var webRequest = HTTPRequest.new()
	webRequest.request_completed.connect(SetIcon)
	webRequest.request_completed.connect(webRequest.queue_free.unbind(4))
	add_child(webRequest)
	
	var ping = webRequest.request(iconURL)
	if ping != OK:
		print("ERROR GETTING GAME ICON")
func DownloadDesc():
	var webRequest = HTTPRequest.new()
	webRequest.request_completed.connect(SetDesc)
	webRequest.request_completed.connect(webRequest.queue_free.unbind(4))
	add_child(webRequest)
	
	var ping = webRequest.request(descURL)
	if ping != OK:
		print("ERROR GETTING GAME DESCRIPTION")
	pass

@warning_ignore("unused_parameter")
func SetIcon(result, code, head, body):
	var img = Image.new()
	var ping = img.load_png_from_buffer(body)
	if ping != OK || !img:
		print("ERROR LOADING GAME ICON")
	
	var tex = ImageTexture.create_from_image(img)
	if !tex:
		print("FAILED TO CREATE TEXTURE")
	
	gameIcon.texture = tex
	pass
@warning_ignore("unused_parameter")
func SetDesc(result, code, head, body):
	descr.text = body.get_string_from_utf8().to_upper()
	pass

func PlayGame():
	OS.shell_open(gameURL)
