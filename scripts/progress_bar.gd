extends ProgressBar

@onready var player = $"../player"
@onready var main = $"../.."

func _process(delta: float) -> void:
	value = player.xp

#func updateXp():
	# print(player.xp)
