extends Node

func _ready():
	$Menu.mostrar_menu()

func juego_tablas():
	var seleccion = $Menu/Menu_tablas_multiplicar.get_sel()
	print("Juego iniciado correctamente")
	print(seleccion)
	$juego_tablas.iniciar_juego(seleccion)
	