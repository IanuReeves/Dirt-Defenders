
class_name HealthComponent extends Node
## used with hitboxcomponent to give objects like enemies, shields, or players
@export var max:float
var current:float:
	set(value):
		current = clamp(value, 0, max)
signal health_changed(amount:float,component:HealthComponent)
signal damaged

'''
this is the healthcomponent, it is meant to be used with the hitboxcomponent.
when using the healthcomponent, ensure that you set it's maximum in either
the editor or in it's parent's _ready() function so that it has some health
to start with.

this probably should have been done when SOMEBODY forgot to set enemies 
max HP to their stats, so that when Ali was making the shield ability
he didnt sit there confused wondering why neither shield OR the enemies 
had working HP and were dying in one hit no matter what, 
making the Iframes pointless and leading to a bunch of confusion
on an ability that would normally take at most 20 minutes to finish T^T
'''

@export var canBeDamaged: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = max

func damage(amount:float):
	if canBeDamaged:
		current -= amount
		health_changed.emit(amount,self)
		damaged.emit()
		if current <= 0:
			if get_parent().has_method("die"):
				get_parent().die()
			else:
				print("killed" + str(self))
				get_parent().queue_free()
		print(current)

func heal(amount:float):
	damage(-amount)
