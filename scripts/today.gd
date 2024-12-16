extends Label

var datetime = Time.get_datetime_dict_from_system()
# Este diccionario incluye: "year", "month", "day", "weekday", "hour", "minute", "second"

# weekday va de 1 a 7 (1=Lunes ... 7=Domingo)
var wday = datetime.weekday

var dias = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var dia_semana = dias[wday - 1]

func _ready() -> void:
	text = dia_semana
