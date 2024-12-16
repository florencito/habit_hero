extends Control

@onready var button1 = $Control/Habits/habitButton_1
@onready var button2 = $Control/Habits/habitButton_2
@onready var button3 = $Control/Habits/habitButton_3
@onready var player = $Control/player
@onready var xpBar = $Control/ProgressBar
@onready var level = $Control/level
@onready var monButton = $Control/weekDayButtons/mondayButton
@onready var tueButton = $Control/weekDayButtons/tuesdayButton
@onready var wedButton = $Control/weekDayButtons/wednesdayButton
@onready var thuButton = $Control/weekDayButtons/thursdayButton
@onready var friButton = $Control/weekDayButtons/fridayButton
@onready var satButton = $Control/weekDayButtons/saturdayButton
@onready var sunButton = $Control/weekDayButtons/sundayButton

var habitCreator_scene = preload("res://scenes/habit_creator.tscn")
var characterChoosing_scene = preload("res://scenes/character_choosing.tscn")
var newLevelSign = preload("res://scenes/new_level.tscn")
var habitButton

signal xp_changed

func _ready() -> void:
	var characterChossing_instance = characterChoosing_scene.instantiate()
	add_child(characterChossing_instance)
	characterChossing_instance.connect("chosenHero", spriteChange)
	player.connect("newLevel", newLevel)

func _process(delta: float) -> void:
	level.text = "Level: " + str(player.level)
	
func spriteChange(hero):
	player.spriteChange(hero)

func _on_habit_button_1_pressed():
	habitButton = button1
	var HabitCreator = habitCreator_scene.instantiate()
	add_child(HabitCreator)
	HabitCreator.connect("save", _on_habit_creator_save)

func _on_habit_creator_save(habit):
	habitButton.text = habit

func _on_habit_button_2_pressed() -> void:
	habitButton = button2
	var HabitCreator = habitCreator_scene.instantiate()
	add_child(HabitCreator)
	HabitCreator.connect("save", _on_habit_creator_save)

func _on_habit_button_3_pressed() -> void:
	habitButton = button3
	var HabitCreator = habitCreator_scene.instantiate()
	add_child(HabitCreator)
	HabitCreator.connect("save", _on_habit_creator_save)

func _on_done_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		player.xp += 34
		player.jump()
		emit_signal("xp_changed")
	else:
		player.xp -= 34
		emit_signal("xp_changed")
		
func newLevel():
	var newLevelSign_instance = newLevelSign.instantiate()
	add_child(newLevelSign_instance)

func reset_week_buttons():
	monButton.set_pressed(false)
	tueButton.set_pressed(false)
	wedButton.set_pressed(false)
	thuButton.set_pressed(false)
	friButton.set_pressed(false)
	satButton.set_pressed(false)
	sunButton.set_pressed(false)

func _on_monday_button_pressed() -> void:
	reset_week_buttons()
	monButton.set_pressed(true)

func _on_tuesday_button_pressed() -> void:
	reset_week_buttons()
	tueButton.set_pressed(true)

func _on_wednesday_button_pressed() -> void:
	reset_week_buttons()
	wedButton.set_pressed(true)

func _on_thursday_button_pressed() -> void:
	reset_week_buttons()
	thuButton.set_pressed(true)

func _on_friday_button_pressed() -> void:
	reset_week_buttons()
	friButton.set_pressed(true)

func _on_saturday_button_pressed() -> void:
	reset_week_buttons()
	satButton.set_pressed(true)

func _on_sunday_button_pressed() -> void:
	reset_week_buttons()
	sunButton.set_pressed(true)
