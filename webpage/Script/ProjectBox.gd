@tool
extends Control

@onready var title: Label = $Titel
@export var titleText: String = "PLACEHOLDER"
@export_range(1, 35) var titleSize: int = 20

@onready var statDisplay: Label = $StatusDisplay
@export var status: PROJECTSTATUS = PROJECTSTATUS.ACTIVE

@onready var icon: TextureRect = $ProjIcon
@export var projectImage: Texture2D

@onready var desc: Label = $Description
@export_multiline var description: String = "REALLY COOL DESCRIPTION"

func _process(delta: float) -> void:
	title.text = titleText
	title.add_theme_font_size_override("font_size", titleSize)
	
	icon.texture = projectImage
	
	desc.text = description
	
	UpdateStatus()

func UpdateStatus():
	match status:
		PROJECTSTATUS.ACTIVE:
			statDisplay.modulate = Color.LIME_GREEN
			statDisplay.text = "ACTIVE"
		PROJECTSTATUS.PAUSED:
			statDisplay.modulate = Color.DARK_ORANGE
			statDisplay.text = "PAUSED"
		PROJECTSTATUS.FINISHED:
			statDisplay.modulate = Color.BLUE
			statDisplay.text = "FINISHED"
		PROJECTSTATUS.CANCELED:
			statDisplay.modulate = Color.RED
			statDisplay.text = "CANCELED"

enum PROJECTSTATUS{
	ACTIVE,
	PAUSED,
	FINISHED,
	CANCELED
	}
