extends Node2D

var characterChossing = preload("res://scenes/character_choosing.tscn")
var pinkMonster = preload("res://scenes/animatedSprites/pink_monster_sprite.tscn")
var owletMonster = preload("res://scenes/animatedSprites/owlet_monster_sprite.tscn")
var dudeMonster = preload("res://scenes/animatedSprites/dude_monster_sprite.tscn")
var animated_sprite = null

signal newLevel

@export var xp = 0
@export var level = 1

@onready var timer = $Timer

func _process(delta: float) -> void:
	if xp >= 100:
		xp = 0
		addLevel()

func addLevel():
	xp = 0
	level += 1
	emit_signal("newLevel")

func _ready() -> void:
	var characterChossing_instance = characterChossing.instantiate()
	characterChossing_instance.connect("chosenHero", spriteChange)
	
func spriteChange(hero):
	if hero == "owletHero":
		var owletMonster_instance = owletMonster.instantiate()
		add_child(owletMonster_instance)
	elif hero == "pinkHero":
		var pinkMonster_instance = pinkMonster.instantiate()
		add_child(pinkMonster_instance)
	elif hero == "dudeHero":
		var dudeMonster_instance = dudeMonster.instantiate()
		add_child(dudeMonster_instance)
		
	animated_sprite = $AnimatedSprite2D

func jump():
	animated_sprite.play("jump")
	timer.start()

func _on_timer_timeout() -> void:
	animated_sprite.play("idle")
