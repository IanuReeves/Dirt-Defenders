extends LimboHSM
class_name ASM


#this is the ALI STATE MACHINE.
# it's derived from the HSM from the limboAI extension
# it's VERY dependent on the Part class, so DONT MESS W IT.
# i will fight you if you mess with it.
# it has a script that checks the parts it has
# whatever part it has get's it's stats read and stacked onto the ASMs stats
# this allows the player code to just read the ASM's stats
# the parts can be coded to change their own stats 

var speed : float = 0 
var attack : float = 0 
var defense : float = 0
var turboboost : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func partcheck():
	get_children()
	for child in get_children():
		speed += child.speed
		attack += child.attack
		defense += child.defense
		turboboost += child.turbo
	print(attack)
	print(speed)
	print(defense)
	print(turboboost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
