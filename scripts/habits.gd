extends Control

# Lista de hábitos (son los mismos para cada día)
var habitos = ["Hábito 1", "Hábito 2", "Hábito 3"]

# Estado de progreso: cada día tiene una lista de booleanos
var progreso_por_dia = {
	"Mon": [false, false, false],
	"Tue": [false, false, false],
	"Wed": [false, false, false],
	"Thu": [false, false, false],
	"Fri": [false, false, false],
	"Sat": [false, false, false],
	"Sun": [false, false, false]
}

# Día actual seleccionado
var dia_actual = "Mon"

# Referencia a los botones de hábitos
@onready var habit_buttons = [
	$doneButton,
	$doneButton2,
	$doneButton3
]

func _ready():
	# Muestra los hábitos para el día actual al inicio
	mostrar_habitos_para_dia(dia_actual)
	
	# Conectar los botones con su índice usando lambdas
	for i in range(habit_buttons.size()):
		habit_buttons[i].connect("pressed", func(): _on_habit_button_pressed(i))

func mostrar_habitos_para_dia(dia):
	# Validar que el día exista en el diccionario
	if not progreso_por_dia.has(dia):
		print("Error: Día no encontrado: ", dia)
		return
	
	print("Mostrando hábitos para el día: ", dia)  # Depuración
	for i in range(habitos.size()):
		habit_buttons[i].set_pressed(progreso_por_dia[dia][i])

func _on_habit_button_pressed(index):
	# Validar que el índice sea un entero válido
	if typeof(index) != TYPE_INT or index < 0 or index >= habitos.size():
		print("Error: Índice fuera de rango o inválido: ", index)
		return
	
	# Actualizar el progreso del hábito
	var estado = habit_buttons[index].is_pressed()
	progreso_por_dia[dia_actual][index] = estado
	print("Progreso actualizado para ", dia_actual, ": ", progreso_por_dia[dia_actual])

# Funciones para cambiar de día
func _on_mon_button_pressed():
	dia_actual = "Mon"
	mostrar_habitos_para_dia(dia_actual)

func _on_tue_button_pressed():
	dia_actual = "Tue"
	mostrar_habitos_para_dia(dia_actual)

func _on_wed_button_pressed():
	dia_actual = "Wed"
	mostrar_habitos_para_dia(dia_actual)

func _on_thu_button_pressed():
	dia_actual = "Thu"
	mostrar_habitos_para_dia(dia_actual)

func _on_fri_button_pressed():
	dia_actual = "Fri"
	mostrar_habitos_para_dia(dia_actual)

func _on_sat_button_pressed():
	dia_actual = "Sat"
	mostrar_habitos_para_dia(dia_actual)

func _on_sun_button_pressed():
	dia_actual = "Sun"
	mostrar_habitos_para_dia(dia_actual)
