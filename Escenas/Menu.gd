extends Node

signal iniciar_juego_tablas

# BLOQUE DE FUNCIONES EXTRA
func mostrar_botones():
	$Inicio.show()
	$Inicio/Opciones.show()
	$Inicio/Info.show()
	$Inicio/Salir.show()

func ocultar_botones():
	$Inicio.hide()
	$Inicio/Opciones.hide()
	$Inicio/Info.hide()
	$Inicio/Salir.hide()

func mostrar_menu():
	$title.show()
	$sub_title.show()
	$Fondo.show()
	mostrar_botones()
	$Menu_song.play()
	
func ocultar_menu():
	$title.hide()
	$sub_title.hide()
	ocultar_botones()
	$Menu_song.stop()
	
func mostrar_fondo():
	$Fondo.show()

func ocultar_fondo():
	$Fondo.hide()
	
func mostrar_menu_modes():
	# Mostramos la siguiente pantalla de menu
	$Menu_Inicio_Modes.mostrar_fondo()
	$Menu_Inicio_Modes.mostrar_menu()
	
func ocultar_menu_modes():
	$Menu_Inicio_Modes.ocultar_fondo()
	$Menu_Inicio_Modes.ocultar_menu()
	
func mostrar_menu_tablas():
	$Menu_tablas_multiplicar.mostrar_menu()
	$Menu_tablas_multiplicar.mostrar_fondo()
	
func init_game_tablas():
	emit_signal("iniciar_juego_tablas")

# BLOQUE DE FUNCIONES DEL ENGINE

func _ready():
	ocultar_menu()

func _on_Inicio_mouse_entered():
	$button_enter_sound.play()

func _on_Opciones_mouse_entered():
	$button_enter_sound.play()

func _on_Info_mouse_entered():
	$button_enter_sound.play()

func _on_Salir_mouse_entered():
	$button_enter_sound.play()

func _on_Inicio_button_down():
	$button_click_sound.play()
	$Menu_song.stop()
	ocultar_menu()
	ocultar_fondo()
	$Timer_Press_Sound.start()
	
	mostrar_menu_modes()
	
func _on_Opciones_button_down():
	$button_click_sound.play()
	$Timer_Press_Sound.start()
	ocultar_menu()
	ocultar_fondo()
	$Menu_opciones.mostrar_fondo()
	$Menu_opciones.mostrar_menu()

func _on_Info_button_down():
	$button_click_sound.play()
	$Timer_Press_Sound.start()
	ocultar_menu()
	ocultar_fondo()
	$Menu_info.mostrar_menu()
	
func _on_Salir_button_down():
	$button_click_sound.play()
	$Timer_Press_Sound.start()
	get_tree().quit()

func _on_Timer_Press_Sound_timeout():
	$button_click_sound.stop()
