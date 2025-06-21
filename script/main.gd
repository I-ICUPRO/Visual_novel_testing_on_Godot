#Используется для старта диалога
extends Node

#Используется для таймера (кэш)
var time_passed: float = 0.0

#через сколько времени будет вызываться
var time_off: float = 5.0

#При запуске сцены, он запускает команды которые есть в нем во время старта
func _ready() -> void:
	#Подписаться и получать сигналы от него
	Dialogic.signal_event.connect(_test_signal)
	
	#Запустить таймлайн
	Dialogic.start("timeline1")


#Вызывается каждый кадр
func  _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= time_off:
		time_passed = 0.0  # Сброс таймера
		# Показывает что находится в переменной типа int
		print("Внутри значение храниться: (", Dialogic.VAR.Global_variables._test_dia, ")")
		# Показывает какой текст был написан через клавиатуру
		print("Текст такой находится: (", Dialogic.VAR.Keyboard._test, ")")
		

#Получения команд от сигнала
func _test_signal(_argument: String) -> void:
	# Проверяется что в сигнале находится
	if _argument == "_test_signal":
		print("Вызывали?")
	# Проверяется что в сигнале находится
	elif _argument == "_not_set":
		print("Ты за кого меня держишь?")
