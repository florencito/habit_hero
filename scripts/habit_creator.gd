extends Control
@onready var habitText = $TextEdit
signal save

var habit: String

func _ready() -> void:
	print(habitText)

func _on_save_button_pressed():
	habit = habitText.text
	print(habit)
	emit_signal("save", habit)
	queue_free()
