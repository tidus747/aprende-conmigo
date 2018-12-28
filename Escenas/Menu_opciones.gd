extends Node

signal ocultar_opciones

# BLOQUE DE FUNCIONES EXTRA
func mostrar_fondo():
	$Fondo.show()

func ocultar_fondo():
	$Fondo.hide()

func mostrar_menu():
	$atras.show()
	$AcceptDialog.popup_centered()

func ocultar_menu():
	$atras.hide()

# BLOQUE DE FUNCIONES DEL ENGINE
func _ready():
	ocultar_menu()
	ocultar_fondo()

func _on_atras_mouse_entered():
	$button_enter_sound.play()


func _on_atras_button_down():
	ocultar_menu()
	ocultar_fondo()
	emit_signal("ocultar_opciones")
	
