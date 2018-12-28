extends Node

signal tablas_multiplicar_inicio
signal tablas_multiplicar_atras

var sel = []

# BLOQUE DE FUNCIONES EXTRA
func ocultar_menu():
	$header.hide()
	$Button_atras.hide()
	$Button_inicio.hide()
	$CheckBox_tabla_1.hide()
	$CheckBox_tabla_2.hide()
	$CheckBox_tabla_3.hide()
	$CheckBox_tabla_4.hide()
	$CheckBox_tabla_5.hide()
	$CheckBox_tabla_6.hide()
	$CheckBox_tabla_7.hide()
	$CheckBox_tabla_8.hide()
	$CheckBox_tabla_9.hide()
	$CheckBox_tabla_todas.hide()
	
func mostrar_menu():
	$header.show()
	$Button_atras.show()
	$Button_inicio.show()
	$CheckBox_tabla_1.show()
	$CheckBox_tabla_2.show()
	$CheckBox_tabla_3.show()
	$CheckBox_tabla_4.show()
	$CheckBox_tabla_5.show()
	$CheckBox_tabla_6.show()
	$CheckBox_tabla_7.show()
	$CheckBox_tabla_8.show()
	$CheckBox_tabla_9.show()
	$CheckBox_tabla_todas.show()
	
func ocultar_fondo():
	$Fondo.hide()
	
func mostrar_fondo():
	$Fondo.show()
	
func get_sel():
	return sel
# BLOQUE DE FUNCIONES DEL ENGINE
func _ready():
	ocultar_fondo()
	ocultar_menu()
	# Llenamos las variables de seleccion de ceros
	for i in range(10):
		sel.append(false)
	
func _on_Button_atras_mouse_entered():
	$button_enter_sound.play()


func _on_Button_inicio_mouse_entered():
	$button_enter_sound.play()
	
func _on_CheckBox_tabla_1_toggled(button_pressed):
	if (button_pressed):
		sel[1] = true
	else:
		sel[1] = false 

func _on_CheckBox_tabla_2_toggled(button_pressed):
	if (button_pressed):
		sel[2] = true
	else:
		sel[2] = false 

func _on_CheckBox_tabla_3_toggled(button_pressed):
	if (button_pressed):
		sel[3] = true
	else:
		sel[3] = false 

func _on_CheckBox_tabla_4_toggled(button_pressed):
	if (button_pressed):
		sel[4] = true
	else:
		sel[4] = false 

func _on_CheckBox_tabla_5_toggled(button_pressed):
	if (button_pressed):
		sel[5] = true
	else:
		sel[5] = false 

func _on_CheckBox_tabla_6_toggled(button_pressed):
	if (button_pressed):
		sel[6] = true
	else:
		sel[6] = false 

func _on_CheckBox_tabla_7_toggled(button_pressed):
	if (button_pressed):
		sel[7] = true
	else:
		sel[7] = false 

func _on_CheckBox_tabla_8_toggled(button_pressed):
	if (button_pressed):
		sel[8] = true
	else:
		sel[8] = false 

func _on_CheckBox_tabla_9_toggled(button_pressed):
	if (button_pressed):
		sel[9] = true
	else:
		sel[9] = false 

func _on_CheckBox_tabla_todas_toggled(button_pressed):
	if (button_pressed):
		sel[0] = true
		$CheckBox_tabla_1.pressed = true
		$CheckBox_tabla_2.pressed = true
		$CheckBox_tabla_3.pressed = true
		$CheckBox_tabla_4.pressed = true
		$CheckBox_tabla_5.pressed = true
		$CheckBox_tabla_6.pressed = true
		$CheckBox_tabla_7.pressed = true
		$CheckBox_tabla_8.pressed = true
		$CheckBox_tabla_9.pressed = true
	else:
		$CheckBox_tabla_1.pressed = false
		$CheckBox_tabla_2.pressed = false
		$CheckBox_tabla_3.pressed = false
		$CheckBox_tabla_4.pressed = false
		$CheckBox_tabla_5.pressed = false
		$CheckBox_tabla_6.pressed = false
		$CheckBox_tabla_7.pressed = false
		$CheckBox_tabla_8.pressed = false
		$CheckBox_tabla_9.pressed = false



func _on_Button_atras_pressed():
	ocultar_fondo()
	ocultar_menu()
	emit_signal("tablas_multiplicar_atras")


func _on_Button_inicio_pressed():
	ocultar_fondo()
	ocultar_menu()
	emit_signal("tablas_multiplicar_inicio")
