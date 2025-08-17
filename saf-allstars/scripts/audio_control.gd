extends HSlider

#Variables
@export var audio_bus_name: String
var audio_bus_id: int
@onready var back: Button = $"../../../../Back" as Button

func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	value_changed.connect(_on_value_changed)
	
	value = db_to_linear(
		AudioServer.get_bus_volume_db(audio_bus_id)
	)
#Audio Settings
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		audio_bus_id,
		linear_to_db(value)
	)
	$"../../../../hover".play()

#Button Functions
func _on_tab_container_tab_hovered(tab: int) -> void:
	$"../../../../hover".play()


func _on_tab_container_tab_clicked(tab: int) -> void:
	$"../../../../click".play()
