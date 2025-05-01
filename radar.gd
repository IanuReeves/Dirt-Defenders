extends Area2D
class_name Radar

var objects : Array

@export var detect_bullets : bool = true

signal detected
signal exited(objectexited : Node2D)

func _on_area_entered(area: Area2D) -> void:
	if detect_bullets:
		if area is Projectile or HitBoxComponent:
			objects.append(area)
			detected.emit()
	else: 
		if area is HitBoxComponent:
			objects.append(area)
			detected.emit()
	


func _on_area_exited(area: Area2D) -> void:
	if detect_bullets:
		if area is Projectile or HitBoxComponent:
			objects.erase(area)
			exited.emit(area)
	else: 
		if area is HitBoxComponent:
			objects.erase(area)
			exited.emit(area)



func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func get_nearest():
	objects.sort_custom(sort_distance)
	return objects[0]


func sort_distance(a,b):
	if a.position.distance_to(position) > b.position.distance_to(position):
		return true
	return false


func sort_health(a,b):
	if a.health.current > b.health.current:
		return true
	return false
