extends Control

@onready var continueButton = $continueButton


func _on_continue_button_pressed() -> void:
	queue_free()
