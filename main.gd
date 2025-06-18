extends Control
var second
var minute
var hour
var clockinTime

func _ready() -> void:
	if
	clockinTime = read_data()

func _process(delta: float) -> void:
	second = ("0"+str(Time.get_datetime_dict_from_system()["second"])) if Time.get_datetime_dict_from_system()["second"] <= 9 else str(Time.get_datetime_dict_from_system()["second"])
	minute = ("0"+str(Time.get_datetime_dict_from_system()["minute"])) if Time.get_datetime_dict_from_system()["minute"] <= 9 else str(Time.get_datetime_dict_from_system()["minute"])
	hour = str(Time.get_datetime_dict_from_system()["hour"])
	$time.text = hour+":"+minute+":"+second
	clockinTime = hour+minute+second
	


func read_data():
	var file = FileAccess.open("user://data.json",FileAccess.READ)
	return(file.get_var())
		



func _on_clockin_pressed() -> void:
	var file = FileAccess.open("user://data.json",FileAccess.WRITE)
	file.store_var(clockinTime)
