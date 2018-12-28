extends Node

signal abrir_operaciones
signal abrir_tablas
signal ocultar_inicio_modes

# BLOQUE DE FUNCIONES EXTRA
func ocultar_botones():
	$atras.hide()
	$button_operaciones.hide()
	$button_tablas.hide()
	
func mostrar_botones():
	$atras.show()
	$button_tablas.show()
	$button_operaciones.show()

func ocultar_menu():
	ocultar_botones()

func mostrar_menu():
	mostrar_botones()
	
func ocultar_fondo():
	$Fondo.hide()
	
func mostrar_fondo():
	$Fondo.show()

# BLOQUE DE FUNCIONES DEL ENGINE
func _ready():
	ocultar_menu()
	ocultar_fondo()

func _on_button_operaciones_mouse_entered():
	$button_enter_sound.play()
	$Popup_operaciones.show()
	$Popup_operaciones/texto_operaciones.push_align(1)
	
func _on_button_operaciones_mouse_exited():
	$Popup_operaciones.hide()

func _on_button_tablas_button_down():
	ocultar_fondo()
	ocultar_menu()
	$Popup_tablas.hide()
	emit_signal("abrir_tablas")


func _on_button_tablas_mouse_entered():
	$button_enter_sound.play()
	$Popup_tablas.show()
	$Popup_tablas/texto_tablas.push_align(1)


func _on_button_tablas_mouse_exited():
	$Popup_tablas.hide()


func _on_atras_button_down():
	ocultar_fondo()
	ocultar_menu()
	emit_signal("ocultar_inicio_modes")

func _on_atras_mouse_entered():
	$button_enter_sound.play()
