extends Control

@onready var gameIcon: TextureRect = $GameIcon
@export var  gameName: String = "ADAURUM"

var domainURL: String = "https://stof2600.github.io/"
var iconURL: String
var gameURL: String

func _ready() -> void:
	var baseURL: String = domainURL + "HTMLGames/" + gameName.to_upper() + "/"
	iconURL = baseURL + "icon.png"
	gameURL = baseURL + gameName
	
	print(iconURL)
	
	DownloadIcon()

func DownloadIcon():
	var webRequest = HTTPRequest.new()
	add_child(webRequest)
	webRequest.connect("request_completed", SetIcon)
	
	var ping = webRequest.request(iconURL)
	if ping != OK:
		print("ERROR GETTING GAME ICON")

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

func PlayGame():
	OS.shell_open(gameURL)
