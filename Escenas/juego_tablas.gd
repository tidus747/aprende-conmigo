extends Node

# Signals
signal respuesta_correcta
signal respuesta_incorrecta

# Variables para el juego
var correctas
var incorrectas
var tiempo
var opc_correcta
var seleccion
var numbers 
var turnos
var rand
var num1
var num2
var resultado
var generado

# BLOQUE DE FUNCIONES EXTRA
func mostrar_menu():
	$Label_Tiempo.show()
	$Label_incorrectas.show()
	$Label_correctas.show()
	
	$Operacion.show()
	$opc_1.show()
	$opc_2.show()
	$opc_3.show()
	$opc_4.show()
	
func ocultar_menu():
	$Label_Tiempo.hide()
	$Label_incorrectas.hide()
	$Label_correctas.hide()
	
	$Operacion.hide()
	$opc_1.hide()
	$opc_2.hide()
	$opc_3.hide()
	$opc_4.hide()
	
func mostrar_fondo():
	$Fondo.show()
	
func ocultar_fondo():
	$Fondo.hide()
	
func gen_numbers(sel):
	var numbers = []
	
	if (sel[0] == true):
		numbers = range(1,10)
	for i in range(1,len(sel)):
		if(sel[i] == true):
			numbers.append(i)
			
	if (numbers == []):
		numbers = range(1,10)
	
	return numbers
	
func marcador_correcta():
	correctas += 1
	$Correct_answer.play()
	$Stopsound.start()
	$Label_correctas.set_text("Correctas: "+str(correctas))
	
func marcador_incorrecta():
	incorrectas +=1
	$Wrong_answer.play()
	$Stopsound.start()
	$Label_incorrectas.set_text("Incorrectas: "+str(incorrectas))
	
	
# BLOQUE DE FUNCIONES DEL ENGINE
func _ready():
	ocultar_menu()
	ocultar_fondo()
	
func pinta_numeros():
	rand = randi()%len(numbers)
	num1 = numbers[rand]
	num2 = randi()%11
	resultado = num1*num2
	
	$Operacion.set_text(str(num1)+" x " + str(num2))
	
	rand = randi()%5+1
	
	# TODO hay que hacer una función que genere los números del resultado de forma automática y que evite que se repitan
	
	if (rand == 1):
		$opc_1.set_text(str(resultado))
		$opc_2.set_text(str(resultado+1+randi()%5+1))
		$opc_3.set_text(str(resultado+1+randi()%10+1))
		$opc_4.set_text(str(resultado-1-randi()%7+1))
		opc_correcta = 1
	if (rand == 2):
		$opc_1.set_text(str(resultado+2+randi()%5+1))
		$opc_2.set_text(str(resultado))
		$opc_3.set_text(str(resultado+1+randi()%10+1))
		$opc_4.set_text(str(resultado-3-randi()%7+1))
		opc_correcta = 2
	if (rand == 3):
		$opc_1.set_text(str(resultado+1+randi()%5+1))
		$opc_2.set_text(str(resultado+2+randi()%13+1))
		$opc_3.set_text(str(resultado))
		$opc_4.set_text(str(resultado-3-randi()%10+1))
		opc_correcta = 3
	if (rand == 4):
		$opc_1.set_text(str(resultado+1+randi()%5+1))
		$opc_2.set_text(str(resultado+1+randi()%10+1))
		$opc_3.set_text(str(resultado-1+randi()%11+1))
		$opc_4.set_text(str(resultado))
		opc_correcta = 4
	

func iniciar_juego(sel):
	
	seleccion = sel
	
	mostrar_menu()
	mostrar_fondo()
	
	$TimerSec.start()
	
	correctas = 0
	incorrectas = 0
	tiempo = 0
	turnos = 0
	generado =0
	
	$Label_Tiempo.set_text("Tiempo: "+str(tiempo))
	$Label_incorrectas.set_text("Incorrectas: "+str(incorrectas))
	$Label_correctas.set_text("Correctas: "+str(correctas))
	
	numbers = gen_numbers(seleccion)
	
	pinta_numeros()
	
func fin_partida():
	ocultar_menu()
	$Popup.show()
	
func _on_TimerSec_timeout():
	tiempo += 1
	$Label_Tiempo.set_text("Tiempo: "+str(tiempo))


func _on_opc_1_pressed():
	if (opc_correcta == 1):
		emit_signal("respuesta_correcta")
		marcador_correcta()
	else:
		emit_signal("respuesta_incorrecta")
		marcador_incorrecta()
	
	turnos += 1
	if (turnos < 10):
		pinta_numeros()
	else:
		print("Fin del juego")
		fin_partida()
	

func _on_opc_2_pressed():
	if (opc_correcta == 2):
		emit_signal("respuesta_correcta")
		marcador_correcta()
	else:
		emit_signal("respuesta_incorrecta")
		marcador_incorrecta()
	
	turnos += 1
	if (turnos < 10):
		pinta_numeros()
	else:
		print("Fin del juego")
		fin_partida()


func _on_opc_3_pressed():
	if (opc_correcta == 3):
		emit_signal("respuesta_correcta")
		marcador_correcta()
	else:
		emit_signal("respuesta_incorrecta")
		marcador_incorrecta()
		
	turnos += 1
	if (turnos < 10):
		pinta_numeros()
	else:
		print("Fin del juego")
		fin_partida()

func _on_opc_4_pressed():
	if (opc_correcta == 4):
		emit_signal("respuesta_correcta")
		marcador_correcta()
	else:
		emit_signal("respuesta_incorrecta")
		marcador_incorrecta()
	
	turnos += 1
	if (turnos < 10):
		pinta_numeros()
	else:
		print("Fin del juego")
		fin_partida()
		


func _on_Stopsound_timeout():
	$Correct_answer.stop()
	$Wrong_answer.stop()
