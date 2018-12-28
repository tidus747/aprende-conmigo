extends Node

signal ocultar_info

# BLOQUE DE FUNCIONES EXTRA
func mostrar_fondo():
	$Fondo.show()

func ocultar_fondo():
	$Fondo.hide()
	
func mostrar_info():
	$Logo_Piensa3D.show()
	$Texto.show()
	
func ocultar_info():
	$Logo_Piensa3D.hide()
	$Texto.hide()

func mostrar_menu():
	$atras.show()
	mostrar_fondo()
	mostrar_info()

func ocultar_menu():
	$atras.hide()
	ocultar_info()
	ocultar_fondo()
	

# BLOQUE DE FUNCIONES DEL ENGINE

func _ready():
	ocultar_menu()
	
func _on_atras_button_down():
	emit_signal("ocultar_info")
	ocultar_menu()
	

func _on_atras_mouse_entered():
	$button_enter_sound.play()
