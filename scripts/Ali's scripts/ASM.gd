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

# these are the stat variables. 
# they are changed by the stats of the parts
# the machine checks for anything that is a part 
# then adds the stats of it's part to get it's own stats.
# the player reads the state machine
# the player doesnt have to do any work.

var speed : float = 0 
var attack : float = 0
var defense : float = 0
var turboboost : float = 0
var handling : float = 0
var accelboost : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func partcheck():
	speed = 0
	attack = 0 
	defense = 0 
	turboboost = 0
	accelboost = 0
	for child in get_children():
		speed += child.speed
		attack += child.attack
		defense += child.defense
		turboboost += child.turbo
		accelboost += child.accel



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	partcheck()
	print(attack)
