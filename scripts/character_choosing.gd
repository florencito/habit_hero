extends Control

@onready var pinkMonster = $heros/pinkMonster
@onready var owletMonster = $heros/owletMonster
@onready var dudeMonster = $heros/dudeMonster
@onready var pinkSprite = $heros/pinkMonster/pinkSprite
@onready var owletSprite = $heros/owletMonster/owletSprite
@onready var dudeSprite = $heros/dudeMonster/dudeSprite

var hero = null

signal chosenHero

func _on_pink_monster_pressed() -> void:
	owletSprite.play("idle")
	dudeSprite.play("idle")
	pinkSprite.play("jump")
	hero = "pinkHero"

func _on_owlet_monster_pressed() -> void:
	owletSprite.play("jump")
	dudeSprite.play("idle")
	pinkSprite.play("idle")
	hero = "owletHero"

func _on_dude_monster_pressed() -> void:
	dudeSprite.play("jump")
	pinkSprite.play("idle")
	owletSprite.play("idle")
	hero = "dudeHero"

func _on_continue_button_pressed() -> void:
	emit_signal("chosenHero", hero)
	queue_free()
