extends Area2D

var inputpower:float = 0


func _on_area_entered(area: HitBoxComponent) -> void:
	area.damage(inputpower)
