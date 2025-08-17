extends Control

#Language
var next_language_index: int = 1
var languages: Array[String] = ["en", "hr"]
var AppID = "480"

func _init():
	OS.set_environment("SteamAppID", AppID)
	OS.set_environment("SteamGameID", AppID)

# Variables
@onready var main_buttons: HBoxContainer = $MainButtons
@onready var options: Control = $Options
@onready var title: TextureRect = $Title

# During the start of the game
func _ready():
	main_buttons.visible = true
	options.visible = false
	title.visible = true
	#Steam
	Steam.steamInit()
	var isRunning = Steam.isSteamRunning()
	
	if !isRunning:
		print("ERROR: Steam failed to load!")
		return
	print("Steam loaded succesfully!")
	
	var id = Steam.getSteamID()
	var Steamname = Steam.getFriendPersonaName(id)
	print("Username: ", str(Steamname))
	

# Button Functions
func _on_start_pressed() -> void:
	print("Start")
	$click.play()

func _on_options_pressed() -> void:
	print("Options")
	$click.play()
	main_buttons.visible = false
	options.visible = true
	title.visible = false


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_mouse_entered() -> void:
	$hover.play()


func _on_options_mouse_entered() -> void:
	$hover.play()

func _on_quit_mouse_entered() -> void:
	$hover.play()


func _on_back_options_pressed() -> void:
	_ready()
	$click.play()


func _on_back_options_mouse_entered() -> void:
	$hover.play()
