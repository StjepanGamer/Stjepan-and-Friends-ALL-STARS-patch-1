extends Button
#Language
var next_language_index: int = 1
var languages: Array[String] = ["eng", "hr"]

func _on_pressed() -> void:
	$"../../../../click".play()
	change_language(languages[next_language_index])
	next_language_index = (next_language_index + 1) % languages.size()

func change_language(lang: String) -> void:
	TranslationServer.set_locale(lang)


func _on_mouse_entered() -> void:
	$"../../../../hover".play()
