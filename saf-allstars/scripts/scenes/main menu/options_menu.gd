extends Control

@onready var back: Button = $Back as Button

func _on_back_mouse_entered() -> void:
	$"../../../../hover".play()

func _on_tab_container_tab_clicked(_tab: int) -> void:
	$"../click".play()


func _on_tab_container_tab_hovered(_tab: int) -> void:
	$"../hover".play()
